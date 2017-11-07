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
import modelo.CrudEmpresa;
import modelo.CrudOferta;
import modelo.Empresa;
import modelo.Oferta;

/**
 *
 * @author Marvin Antillon
 */
public class ControlIngresoEmp extends HttpServlet {

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
        
        RequestDispatcher rd=null;
        Oferta ofer=new Oferta();
        CrudOferta cdof=new CrudOferta();
        
        ofer.setNombre(request.getParameter("nombreOfe"));
                ofer.setDescripcion(request.getParameter("descripcion"));
                ofer.setSalario(Double.parseDouble(request.getParameter("salario")));
                ofer.setVacante(Integer.parseInt(request.getParameter("vacantes")));
                ofer.setEdadRequerida(request.getParameter("edad"));
                ofer.setExpRequerida(Integer.parseInt(request.getParameter("expeR")));
                ofer.setGeneroRequerido(request.getParameter("genero"));
                ofer.setTipoContratacion(request.getParameter("tipoC"));
                ofer.setIdEmpresa(Integer.parseInt(request.getParameter("idEmp")));
        
        try 
        {
            if(request.getParameter("insertar")!=null)
            {
               
                cdof.InsertarOferta(ofer);
                
            }
            rd=request.getRequestDispatcher("/empresar/registaremp/datosemp.jsp");
        } 
        catch (Exception e) 
        {
            request.setAttribute("error", e.toString());
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
