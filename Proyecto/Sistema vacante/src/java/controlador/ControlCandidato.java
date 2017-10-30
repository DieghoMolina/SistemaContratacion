/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.resource.cci.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Candidato;
import modelo.CrudCandidato;
import modelo.CrudUsuario;
import modelo.Usuario;

/**
 *
 * @author Marvin Antillon
 */
public class ControlCandidato extends HttpServlet {

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
        CrudCandidato cc=new CrudCandidato();
        Usuario us = new Usuario();
        Candidato c= new Candidato();
        CrudUsuario cu = new CrudUsuario();
        String val=null;
        
        try {
            c.setIdCandidato(Integer.parseInt(request.getParameter("codigo")));
            c.setNombre((request.getParameter("nombre")));
            c.setApellido((request.getParameter("apellido")));
            c.setCorreo((request.getParameter("email")));
            c.setTelefono((request.getParameter("tel")));
            c.setGenero((request.getParameter("genero")));
            c.setFechaNac((request.getParameter("fecha")));
            c.setFoto((request.getParameter("foto")));
            c.setIdioma((request.getParameter("idioma")));
            c.setHabilidad((request.getParameter("habilidad")));
            c.setIdDepto(Integer.parseInt(request.getParameter("departamento")));
            c.setExpLaboral(Integer.parseInt(request.getParameter("experiencia")));
            c.setIdMunicipio(Integer.parseInt(request.getParameter("municipio")));
            c.setIdProfecion(Integer.parseInt(request.getParameter("profesion")));
            c.setIdNivelAcad(Integer.parseInt(request.getParameter("nivel")));
            c.setIdUsuario(Integer.parseInt(request.getParameter("user")));
            us.setIdUsuario(Integer.parseInt(request.getParameter("user")));
            if(request.getParameter("btnInsertar")!=null)
            {
            cc.InsertarCandidato(c);
            val="Datos Insertados Exitosamente";
            } 
            if(request.getParameter("btnModificar")!=null)
            {
            cc.ModificarCandidato(c);
            val="Datos Modificados Exitosamente";
            }
            if(request.getParameter("btnEliminar")!=null)
            {
            cc.EliminarCandidato(c);
            cu.eliminarUsuario(us); 
            val="Datos Insertados Exitosamente";
            }
            rd=request.getRequestDispatcher("/admin/dashboard/pcandidato.jsp");
            request.setAttribute("valor", val);
        } catch (Exception e) {
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
