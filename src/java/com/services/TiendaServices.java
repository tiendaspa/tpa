/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.controller.Utilidades;
import com.dao.ImplDao;
import com.entity.Cliente;
import com.entity.Noticia;
import com.entity.Tienda;
import com.implDao.ITienda;
import java.io.Serializable;
import java.util.ArrayList;

import java.util.List;

import javax.persistence.Query;

/**
 *
 * @author DAC-PC
 */
public class TiendaServices extends ImplDao<Tienda , Long> implements ITienda,Serializable{
    Utilidades utl = new Utilidades();
  
    @Override
    public Tienda iniciarsesion(Tienda t) {
        String pass = t.getContraseña();
        t.setContraseña(utl.Encriptar(pass));
        Tienda tienda = null;
        String consulta;
        try {
            consulta = "FROM Tienda t WHERE t.usuario = ?1 and t.contrasena = ?2";
            Query query = getEmf().createEntityManager().createQuery(consulta);
            query.setParameter(1, t.getUsuario());
            query.setParameter(2, t.getContraseña());
            List<Tienda> lista =query.getResultList();
            
            if(!lista.isEmpty()){
                tienda = lista.get(0);
            }
        } catch (Exception e) {
            throw  e;
        }finally{
            getEntityManagger().close();
        }
        return tienda;
    
    
    }

    @Override
    public Long Obtenerultima() {
        long id=0;
        String consulta;
     
        try {
            consulta = "SELECT MAX(id) FROM Tienda";
            Query query = getEmf().createEntityManager().createQuery(consulta);
        
            id= (long) query.getSingleResult();
        } catch (Exception e) {
            throw  e;
        }finally{
            getEntityManagger().close();
        }
        return id;
    }

    @Override
    public List<Cliente> Clienteestrella() {
        List<Cliente> listacliente;
        String consulta;
     
        try {
            consulta = "SELECT i.cliente FROM Ingresos i  GROUP by i.cliente ORDER BY COUNT(i.cliente) DESC ";
            Query query = getEmf().createEntityManager().createQuery(consulta).setMaxResults(1);
          
            listacliente = query.getResultList();
          
         
        } catch (Exception e) {
            throw  e;
        }finally{
            getEntityManagger().close();
        }
        return listacliente;
    }

    @Override
    public List<Noticia> listarnoticias() {
        List<Noticia> lisnoticias = new ArrayList<>();
        try {
            String consulta = "FROM Noticia c ORDER BY c.id DESC";
            Query query = getEmf().createEntityManager().createQuery(consulta).setMaxResults(3);
            lisnoticias = query.getResultList();
            return lisnoticias;
        } catch (Exception e) {
            throw e;
        }finally{
            getEntityManagger().close();
        }
       
    }

  
    }
 
    

