package poly.edu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

/**
 * Servlet implementation class UserServlet
 */

@WebServlet("/UserServlet.php")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = null;
		UserDao dao = new UserDao();
		String action = request.getParameter("action");

		try {
			if (action == null || action.equals("")) {
				request.setAttribute("LIST_USER", dao.dumData());
				request.getRequestDispatcher("views/display-user.jsp").forward(request, response);
				return;
			}

			switch (action) {
			case "AddOrEdit": {
				String username = request.getParameter("username");
				user = dao.findByUsername(username);
				if(user == null) {
					user = new User();
				}
				request.setAttribute("USER", user);
				request.getRequestDispatcher("views/register.jsp").forward(request, response);

				break;
			}
			case "SaveOrUpdate":{
				DateTimeConverter dtc = new DateConverter(new Date());
				dtc.setPattern("dd/MM/yyyy");
				ConvertUtils.register(dtc, Date.class);
				user = new User();
				BeanUtils.populate(dtc, request.getParameterMap());
				dao.save(user);
				request.getRequestDispatcher("views/register.jsp").forward(request, response);
				break;
			}
			case "list": {
				request.setAttribute("LIST_USER", dao.getAll());
				request.getRequestDispatcher("views/display-user.jsp").forward(request, response);
			}
			case "Delete": {
				String username = request.getParameter("username");
				if(dao.findByUsername(username) != null) {
					dao.delete(username);
				}
				request.setAttribute("LIST_USER", dao.getAll());
				request.getRequestDispatcher("views/display-user.jsp").forward(request, response);
			}
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
