package com.veerasundar.twikural;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.veerasundar.twikural.model.Thirukural;
import com.veerasundar.twikural.model.TwikuralData;

public class Archive extends HttpServlet {

	private static final long serialVersionUID = -5639804563457719693L;
	private static final Logger logger = Logger.getLogger(Archive.class.getName());
	final static PersistenceManager pm = PMF.get().getPersistenceManager();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.log(Level.FINE, "Going to retrieve the list of old Thirukurals");

		TwikuralData tdata = null;
		try {
			Key key = KeyFactory.createKey(TwikuralData.class.getSimpleName(), "twitter");
			tdata = pm.getObjectById(TwikuralData.class, key);
		} catch (Exception e) {
			tdata = null;
			logger.log(Level.SEVERE, "The twitter data object is null. Can't continue.");
		}

		if (tdata != null) {
			List<Thirukural> pastKurals = new ArrayList<Thirukural>();
			int kuralId = tdata.getNextKuralId()-1;
			while (kuralId != 0) {
				pastKurals.add(pm.getObjectById(Thirukural.class, kuralId));
				kuralId--;
			}

			req.setAttribute("pastKurals", pastKurals);
			req.getRequestDispatcher("archive.jsp").forward(req, resp);

		}
	}
}
