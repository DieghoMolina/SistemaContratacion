/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.CrudExpLaboral;
import modelo.ExpLaboral;

/**
 *
 * @author CASA
 */
public class ProcesarExpLaboral extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        
        CrudExpLaboral crud = new CrudExpLaboral();
        ExpLaboral exp = new ExpLaboral();
        String val = null;
        RequestDispatcher rd = null;
        try
        {
           
           exp.setNombre(request.getParameter("nombreempresa"));
           exp.setCargo(request.getParameter("cargo"));
           exp.setFechaInicio(request.getParameter("fechaini"));
           exp.setFechaFin(request.getParameter("fechafin"));
           exp.setIdCandidato(Integer.parseInt(request.getParameter("candidato")));
           
           if(request.getParameter("btnInsertar")!=null)
           {
               crud.insertarExpLaboral(exp);
               val = "Datos Insertados Exitosamente";
           }
           if(request.getParameter("btnModificar")!=null)
           {
               crud.modificarExplaboral(exp);
               val = "Datos Modificados Exitosamente";
           }
            if(request.getParameter("btnEliminar")!=null)
           {
               crud.eliminarExpLaboral(exp);
               val = "Datos Eliminados Exitosamente";
           }
           rd = request.getRequestDispatcher("admin/dashboard/pExpLaboral.jsp");
           request.setAttribute("Valor", val);
        }catch(Exception e)
        {
             request.setAttribute("Error", e.toString());
        }
        rd.forward(request, response);
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