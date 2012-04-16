package com.veerasundar.twikural;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Transaction;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.veerasundar.twikural.model.TwikuralData;

import twitter4j.IDs;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;

public class UpdateSubscribers extends HttpServlet {

	private static final long serialVersionUID = 1817114859050081592L;
	final static Twitter twitter = new TwitterFactory().getInstance();
	final static PersistenceManager pm = PMF.get().getPersistenceManager();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		if (req.getHeader("X-AppEngine-Cron") == null) {
			return;
		}

		Key key = KeyFactory.createKey(TwikuralData.class.getSimpleName(),
				"twitter");
		TwikuralData subscribers;
		try {
			subscribers = pm.getObjectById(TwikuralData.class, key);
		} catch (Exception e) {
			subscribers = null;
		}

		if (subscribers == null) {
			subscribers = new TwikuralData();
			subscribers.setKey(key);
		}

		List<Long> idList = new ArrayList<Long>();
		try {
			IDs followersIDs = twitter.getFollowersIDs(-1);
			for (long id : followersIDs.getIDs()) {
				idList.add(id);
			}
		} catch (TwitterException e) {
			e.printStackTrace();
		}

		subscribers.setFollowers(idList);
		Transaction txn = pm.currentTransaction();
		try {
			txn.begin();
			pm.makePersistent(subscribers);
			txn.commit();
		} finally {
			if (txn.isActive()) {
				txn.rollback();
			}
		}
	}

}
