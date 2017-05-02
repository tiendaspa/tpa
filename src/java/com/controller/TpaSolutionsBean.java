/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.services.IngresosServices;
import java.util.ArrayList;
import java.util.List;
import javax.faces.bean.ManagedBean;

import javax.faces.bean.SessionScoped;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

/**
 *
 * @author DAC-PC
 */
@ManagedBean
@SessionScoped
public class TpaSolutionsBean {
    private List<Status> listatuit = new ArrayList<>();
    private double ingreso;
    
    public TpaSolutionsBean() throws TwitterException {
    
    }
    
  

    public List<Status> getListatuit() {
        return listatuit;
    }

    public void setListatuit(List<Status> listatuit) {
        this.listatuit = listatuit;
    }
    
}
