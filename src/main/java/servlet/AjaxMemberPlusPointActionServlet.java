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

@WebServlet("/AjaxMemberPlusPointActionServlet")
public class AjaxMemberPlusPointActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int r = (int)(Math.random()*1000)+1;
		int point = r;
		MemberDao dao = new MemberDao();
		int newPoint = 0;
		try {
			 dao.plusPoint(point, id);;
			 newPoint = dao.getMemberDto(id).getPoint();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 response.setCharacterEncoding("utf-8");
		    response.setContentType("application/json");
		    PrintWriter out = response.getWriter();
		    JSONObject obj = new JSONObject();
		    obj.put("point", newPoint);
		    obj.put("newPoint", point);
		    out.println(obj);
	}
}
