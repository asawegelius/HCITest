package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Type;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

/**
 * Servlet implementation class ResultServlet
 */
public class ResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Type listTypeInt = new TypeToken<List<Integer>>() {}.getType();
		Type listTypeDoub = new TypeToken<List<Double>>() {}.getType();
		List<Integer> right = new Gson().fromJson(request.getParameter("rightAnswer"), listTypeInt);
		List<Integer> rightDistracted = new Gson().fromJson(request.getParameter("rightAnswerDistracted"), listTypeInt);
		List<Double> resp = new Gson().fromJson(request.getParameter("responseTime"), listTypeDoub);
		List<Double> respDistracted = new Gson().fromJson( request.getParameter("responseTimeDistracted"), listTypeDoub);
		request.setAttribute("rightAnswer", right);
		request.setAttribute("rightAnswerDistracted", rightDistracted);
		request.setAttribute("responseTime", resp);
		request.setAttribute("responseTimeDistracted",respDistracted);
		request.getRequestDispatcher((request.getParameter("address") + ".jsp")).forward(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
