package com.veerasundar.twikural;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jsr107cache.Cache;

import com.veerasundar.twikural.model.Thirukural;

public class KuralExplain extends HttpServlet {

	private static final long serialVersionUID = 2441842794329469780L;

	final static PersistenceManager pm = PMF.get().getPersistenceManager();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String kuralId = req.getParameter("id");
		if (kuralId != null && !kuralId.trim().equals("")) {
			Long kuralLong = 0l;
			if (kuralId.trim().length() == 1) {
				kuralLong = Long.parseLong(kuralId);
			} else {
				kuralLong = Long.valueOf(kuralId, 16) - 10297;
			}
			try {
				Thirukural kural = pm.getObjectById(Thirukural.class, kuralLong);
				if (kural != null) {
					req.setAttribute("tamil", kural.getTamil().getValue());
					req.setAttribute("kalaignar", kural.getKalaignar().getValue());
					req.setAttribute("muva", kural.getMuva().getValue());
					req.setAttribute("pops", kural.getPops().getValue());
					req.setAttribute("english", kural.getEnglish().getValue());
					req.setAttribute("explain", kural.getExplain().getValue());
					req.setAttribute("id", kuralId);

					if (kuralLong > 1) {
						req.setAttribute("prev", Long.toString(kuralLong - 1 + 10297, 16));
					}
					
					if(kuralLong < 1330){
						req.setAttribute("next", Long.toString(kuralLong + 1 + 10297, 16));
					}
				}
			} catch (Exception e) {
			}
		}
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}

}
