/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.SesionBeanEJB;
import entities.Producto;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static servlets.AgregarProducto.STATUS_ERROR;
import static servlets.AgregarProducto.STATUS_OK;

/**
 *
 * @author Ivan
 */
public class EditarProducto extends HttpServlet {

    @EJB
    SesionBeanEJB miEjb;
    
    public static final String STATUS_OK = "productoOK";
    public static final String STATUS_ERROR = "productoError";

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        if ("Guardar".equals(request.getParameter("editar"))){
            // Modificamos el Producto
        int id = Integer.parseInt(request.getParameter("productos"));
        String nombre = request.getParameter("nombreNuevo");
        String cantidad = request.getParameter("cantidadNueva");
        double precio = Double.parseDouble(request.getParameter("precioNuevo"));
        Producto p = new Producto(id, nombre, cantidad, precio);
        if (miEjb.modificarProducto(p)){
                request.setAttribute("status", STATUS_OK);
            } else {
                request.setAttribute("status", STATUS_ERROR);
            }
              request.getRequestDispatcher("/final.jsp").forward(request, response); 
        }else {
        List<Producto> producto = miEjb.selectAllProductos();
        request.setAttribute("producto", producto);
        request.getRequestDispatcher("/editarProducto.jsp").forward(request, response);   
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
