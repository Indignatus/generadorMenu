/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.SesionBeanEJB;
import entities.Menu;
import entities.Producto;
import java.io.IOException;
import static java.lang.Integer.parseInt;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sergi
 */
public class ManagerMenu extends HttpServlet {

    @EJB
    SesionBeanEJB ejb;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if ("mostrarProducto".equals(request.getParameter("parameter"))) {
            List<Producto> listaProducto = ejb.mostrarProducto();
            request.setAttribute("parameterListaProducto", listaProducto);
            request.getRequestDispatcher("/crearMenu.jsp").forward(request, response);
        } else if ("crearMenu".equals(request.getParameter("parameter"))) {

            String name = request.getParameter("name");
            String type = request.getParameter("type");
            String temporada = request.getParameter("temporada");
            int primerPlato = parseInt(request.getParameter("primerPlato"));
            int segundoPlato = parseInt(request.getParameter("segundoPlato"));
            int postre = parseInt(request.getParameter("postre"));
            int bebida = parseInt(request.getParameter("bebida"));
            double precio = Double.parseDouble(request.getParameter("precio"));

            Menu menu = new Menu();

            menu.setNombre(name);
            menu.setSemana(type);
            menu.setTemporada(temporada);
            menu.setPrimerPlato(ejb.buscarProductoById(primerPlato));
            menu.setSegundoPlato(ejb.buscarProductoById(segundoPlato));
            menu.setPostre(ejb.buscarProductoById(postre));
            menu.setBebida(ejb.buscarProductoById(bebida));
            menu.setPrecio(precio);


            ejb.createMenu(menu);

            response.sendRedirect(request.getContextPath() + "/login.jsp");

        } else if ("mostrarMenu".equals(request.getParameter("mostrarMenu"))) {

            String semana = request.getParameter("type");

            // buscar menus segun el filtro semana 
            List<Menu> menu = ejb.mostrarMenuPorSemana(semana);
            if (menu != null) {
                request.setAttribute("listaMenu", menu);
                request.setAttribute("filtro", "filtro");
                request.getRequestDispatcher("/mostrarMenu.jsp").forward(request, response);
            }

        } else if ("borrar".equals(request.getParameter("borrar"))){
            List<Menu> menu = ejb.mostrarMenu();
            if (menu != null) {
                request.setAttribute("listaMenu", menu);
                request.getRequestDispatcher("/borrarMenu.jsp").forward(request, response);
            }
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
