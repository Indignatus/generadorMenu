/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.SesionBeanEJB;
import entities.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dam
 */
public class AgregarProducto extends HttpServlet {

    @EJB
    SesionBeanEJB miEjb;
    
    public static final String STATUS_OK = "productoOK";
    public static final String STATUS_ERROR = "productoError";
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
            if("Agregar".equals(request.getParameter("agregarproducto"))){
            //Recogemos las variables del formulario
            String nombre = request.getParameter("nombre");
            String cantidad = request.getParameter("cantidad");
            double precio = Double.parseDouble(request.getParameter("precio"));
            Producto p = new Producto(0, nombre,cantidad,precio);
            if (miEjb.insertarProducto(p)){
                request.setAttribute("status", STATUS_OK);
            } else {
                request.setAttribute("status", STATUS_ERROR);
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
