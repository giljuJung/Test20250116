package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.MemberDao;

@WebServlet("/AjaxMemberPointActionServlet")
public class AjaxMemberPointActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int point = Integer.parseInt(request.getParameter("point"));
		MemberDao dao = new MemberDao();
		int newPoint = 0;
		try {
			 dao.minusPoint(point, id);
			 newPoint = dao.getMemberDto(id).getPoint();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 	response.setCharacterEncoding("utf-8");
		    response.setContentType("application/json");
		    PrintWriter out = response.getWriter();
		    JSONObject obj = new JSONObject();
		    obj.put("point", newPoint);
		    out.println(obj);
	}

}
