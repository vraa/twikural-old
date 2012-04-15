package com.veerasundar.twikural;

import java.io.IOException;
import java.util.Iterator;

import javax.jdo.PersistenceManager;
import javax.jdo.Transaction;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.google.appengine.api.datastore.Text;
import com.veerasundar.twikural.model.Kural;
import com.veerasundar.twikural.model.Thirukural;

public class Setup extends HttpServlet {

	private static final long serialVersionUID = -6472991864712999134L;

	final static PersistenceManager pm = PMF.get().getPersistenceManager();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pin = req.getParameter("pin");
		if (pin != null && pin.trim().equals("zeeboomba")) {
			Thirukural thirukural = new Thirukural();
			thirukural.setKey(Long.parseLong(req.getParameter("id")));
			thirukural.setTamil(new Text(req.getParameter("tamil")));
			thirukural.setKalaignar(new Text(req.getParameter("kalaignar")));
			thirukural.setMuva(new Text(req.getParameter("muva")));
			thirukural.setPops(new Text(req.getParameter("pops")));
			thirukural.setEnglish(new Text(req.getParameter("english")));
			thirukural.setExplain(new Text(req.getParameter("explain")));

			Transaction txn = pm.currentTransaction();
			try {
				txn.begin();
				pm.makePersistent(thirukural);
				txn.commit();
			} finally {
				if (txn.isActive()) {
					txn.rollback();
				}
			}
		}
	}
}
