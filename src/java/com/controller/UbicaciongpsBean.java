/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.entity.Ubicaciongps;
import com.services.UbicaciongpsServices;
import java.util.ArrayList;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.swing.JOptionPane;
import org.primefaces.event.map.OverlaySelectEvent;
import org.primefaces.model.map.DefaultMapModel;
import org.primefaces.model.map.LatLng;
import org.primefaces.model.map.MapModel;
import org.primefaces.model.map.Marker;

/**
 *
 * @author DAC-PC
 */
@ManagedBean
@SessionScoped
public class UbicaciongpsBean {
         
    private MapModel advancedModel;
    private List<MapModel> listamapmodel = new ArrayList<>();
    private ArrayList<Ubicaciongps> listaubicacion = new ArrayList<>();
    private Marker marker;
    
    public UbicaciongpsBean() {
     listarmap();
    }
    public void listarmap(){
        boolean estado = true;
        UbicaciongpsServices ubser = new UbicaciongpsServices();
        setListaubicacion((ArrayList<Ubicaciongps>) ubser.consultarTodo(Ubicaciongps.class));
        String logo = "http://icons.iconarchive.com/icons/custom-icon-design/flatastic-11/32/Shop-icon.png";
        advancedModel = new DefaultMapModel();
        for(int i = 0; i < getListaubicacion().size(); i++){
            LatLng coordi = new LatLng(Double.parseDouble(getListaubicacion().get(i).getLatitud()),Double.parseDouble(getListaubicacion().get(i).getLonguitud()));
           
            if(getListaubicacion().get(i).getTienda().isEstado()==true){
                advancedModel.addOverlay(new Marker(coordi, "Tienda " + getListaubicacion().get(i).getTienda().getNombretienda(),"http://gasmilenio.com/f/ICONO_TIENDACONVENIENCIA_s1.jpg", logo));
            
             }
            if(getListaubicacion().get(i).getTienda().isEstado()==false){
                advancedModel.addOverlay(new Marker(coordi, "Tienda " + getListaubicacion().get(i).getTienda().getNombretienda(), "http://gasmilenio.com/f/ICONO_TIENDACONVENIENCIA_s1.jpg", "http://icons.iconarchive.com/icons/icons8/windows-8/32/Business-Shop-icon.png"));
            }
           
            
        }
         
      
    
    }

    public List<MapModel> getListamapmodel() {
        return listamapmodel;
    }

    public void setListamapmodel(List<MapModel> listamapmodel) {
        this.listamapmodel = listamapmodel;
    }

    public ArrayList<Ubicaciongps> getListaubicacion() {
        return listaubicacion;
    }

    public void setListaubicacion(ArrayList<Ubicaciongps> listaubicacion) {
        this.listaubicacion = listaubicacion;
    }
    public MapModel getAdvancedModel() {
        return advancedModel;
    }
      
    public void onMarkerSelect(OverlaySelectEvent event) {
        marker = (Marker) event.getOverlay();
    }
      
    public Marker getMarker() {
        return marker;
    }
    
}
