package org.sapid;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sapid.ar.jxmodel.ToXMLConverter;
import org.sapid.parser.common.ParseException;
import org.sapid.parser.jxmodel.JavaParser;
import org.sapid.parser.jxmodel.JxModelBuilder;

public class JXServlet extends HttpServlet {

	/** auto generated. */
	private static final long serialVersionUID = -8104479739228352842L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String code = req.getParameter("code");

		String result = "";

		InputStream isr = new ByteArrayInputStream(code.getBytes());
		try {
			result = parseCode(isr);
		} catch (ParseException e) {
			throw new ServletException(e);
		} finally {
			if (isr != null) {
				isr.close();
			}
		}

		ServletOutputStream out = resp.getOutputStream();
		resp.setContentType("text/xml");
		out.write(result.getBytes());
		out.flush();
		out.close();
	}

	public String parseCode(InputStream isr) throws ParseException {
		String result = "";
		JavaParser parser = new JavaParser(isr);
		parser.disable_tracing();
		JxModelBuilder visitor = new JxModelBuilder();
		try {
			parser.CompilationUnit().jjtAccept(visitor, null);
			ToXMLConverter converter = new ToXMLConverter();
			visitor.getRootNode().accept(converter, null);
			result = converter.getResult();
		} catch (org.sapid.parser.jxmodel.ParseException e) {
			throw new ParseException(e);
		}
		return result;
	}

}
