package org.sapid;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

import org.sapid.model.JSXModelOnMemory;
import org.sapid.parser.common.ParseException;
import org.xml.sax.SAXException;

public class JSXServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/xml");
		resp.setCharacterEncoding("utf-8");
		String code = req.getParameter("code");
		JSXModelOnMemory model = new JSXModelOnMemory(code);
		String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
		if (code != null && code.length() > 0) {
			try {
				model.analyze();
				xml = model.getModelByString();
			} catch (ParseException e) {
				throw new ServletException(e);
			} catch (ParserConfigurationException e) {
				throw new ServletException(e);
			} catch (SAXException e) {
				throw new ServletException(e);
			}
		}
		resp.getWriter().println(xml);
	}
}
