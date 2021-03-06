package servlets;

import beans.SesionBeanEJB;
import entities.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;

import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewUser extends HttpServlet {

    public static final String STATUS_OK = "userOk";
    public static final String STATUS_ERROR = "userError";
    @EJB
    SesionBeanEJB ejb;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if ("New".equals(request.getParameter("newuser"))) {

            String name = request.getParameter("name");
            String pass = request.getParameter("pass");

            Usuario u = new Usuario(name, pass);

            if (ejb.createUser(u)) {
                request.setAttribute("status", STATUS_OK);
            } else {
                request.setAttribute("status", STATUS_ERROR);
            }
            request.getRequestDispatcher("/final.jsp").forward(request, response);
        } else if ("Ver Lista de Usuarios".equals(request.getParameter("veruser"))) {
            List<Object[]> listaUsuarios = ejb.mostrarUsuarios();
            request.setAttribute("mostrarUsuarios", listaUsuarios);
            request.getRequestDispatcher("/mostrarUsuarios.jsp").forward(request, response);

        } else if ("borrar".equals(request.getParameter("borrar"))) {

            if (ejb.borrar(parseInt(request.getParameter("borrarId")))) {

                request.setAttribute("status", "Borrado correctamente");

            } else {
                request.setAttribute("status", "Borrado incorrectamente");
            }
            request.getRequestDispatcher("/final.jsp").forward(request, response);

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
