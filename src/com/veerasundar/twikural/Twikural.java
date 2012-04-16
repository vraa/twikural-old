package com.veerasundar.twikural;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.jdo.Transaction;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.veerasundar.twikural.model.Thirukural;
import com.veerasundar.twikural.model.TwikuralData;

@SuppressWarnings("serial")
public class Twikural extends HttpServlet {

	final static Twitter twitter = new TwitterFactory().getInstance();
	final static PersistenceManager pm = PMF.get().getPersistenceManager();
	final static Logger logger = Logger.getLogger(Twikural.class.getName());

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		if (req.getHeader("X-AppEngine-Cron") == null) {
			return;
		}
		
		logger.log(Level.INFO, "Starting the scheduled task of sending out kurals");

		TwikuralData tdata = null;
		try {
			Key key = KeyFactory.createKey(TwikuralData.class.getSimpleName(), "twitter");
			tdata = pm.getObjectById(TwikuralData.class, key);
		} catch (Exception e) {
			tdata = null;
			logger.log(Level.SEVERE, "The twitter data object is null. Can't continue.");
		}

		if (tdata != null) {

			logger.log(Level.INFO, "Going to iterate through twitter IDs and sent out DMs");
			int kuralId = tdata.getNextKuralId();
			kuralId = kuralId == 0 ? 1 : kuralId;
			tdata.setNextKuralId(kuralId + 1);
			Transaction txn = pm.currentTransaction();
			try {
				txn.begin();
				pm.makePersistent(tdata);
				logger.log(Level.INFO, "Successfully incremented the kural counter to next one");
				txn.commit();
			} finally {
				if (txn.isActive()) {
					txn.rollback();
				}
			}

			Thirukural kural = pm.getObjectById(Thirukural.class, kuralId);
			StringBuilder kuralText = new StringBuilder();
			kuralText.append(kural.getTamil().getValue().replace("<br>", " / "));
			kuralText.append(" / விளக்கம் காண: http://twikural.veerasundar.com/kural?id="
					+ Long.toString(kuralId + 10297, 16));

			try {
				kuralText.append("  #thirukural");
				twitter.updateStatus(kuralText.toString());
				List<Long> ids = tdata.getFollowers();
				for (Long id : ids) {
					twitter.sendDirectMessage(id, kuralText.toString());
				}
				logger.log(Level.INFO, "Sent out direct message to " + ids.size() +  " recipients.");
				logger.log(Level.INFO, "Updated self status");
			} catch (TwitterException e) {
				logger.log(Level.SEVERE, "Twitter Error:" + e.getErrorMessage());
			}
			
			logger.log(Level.INFO, "Successfully completed the scheduled task");
		}

	}
}
