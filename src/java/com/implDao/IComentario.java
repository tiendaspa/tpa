/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.implDao;

import com.dao.IDao;
import com.entity.Comentario;
import com.entity.Tienda;
import java.util.List;

/**
 *
 * @author DAC-PC
 */
public interface IComentario extends IDao<Comentario, Long>{
     List<Comentario> listarcomentario(Tienda c);
     Comentario vercomentario(Long id);
}
