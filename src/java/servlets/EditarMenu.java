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
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static servlets.EditarMenu.STATUS_ERROR;
import static servlets.EditarMenu.STATUS_OK;

/**
 *
 * @author Ivan
 */
public class EditarMenu extends HttpServlet {

    @EJB
    SesionBeanEJB miEjb;
    
    public static final String STATUS_OK = "menuOK";
    public static final String STATUS_ERROR = "menuError";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        if ("Guardar".equals(request.getParameter("editar"))){
            // Modificamos el Producto
        int id = Integer.parseInt(request.getParameter("menu"));
        String nombre = request.getParameter("nombreNuevoMenu");
        String type = request.getParameter("type");
        String temporada = request.getParameter("nombreNuevaTemporada");
        int primerPlato = parseInt(request.getParameter("nuevoPrimerPlato"));
        int segundoPlato = parseInt(request.getParameter("nuevoSegundoPlato"));
        int postre = parseInt(request.getParameter("nuevoPostre"));
        int bebida = parseInt(request.getParameter("nuevaBebida"));
        double precio = Double.parseDouble(request.getParameter("nuevoPrecio"));
        Menu menu = new Menu();

            menu.setNombre(nombre);
            menu.setSemana(type);
            menu.setTemporada(temporada);
            menu.setPrimerPlato(miEjb.buscarProductoById(primerPlato));
            menu.setSegundoPlato(miEjb.buscarProductoById(segundoPlato));
            menu.setPostre(miEjb.buscarProductoById(postre));
            menu.setBebida(miEjb.buscarProductoById(bebida));
            menu.setPrecio(precio);


            miEjb.createMenu(menu);

            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }else {
        List<Menu> menu = miEjb.mostrarMenu();
        List<Producto> productos = miEjb.mostrarProducto();
        request.setAttribute("menu", menu);
        request.setAttribute("productos", productos);
        request.getRequestDispatcher("/editarMenu.jsp").forward(request, response);   
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
