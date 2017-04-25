/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import entities.Producto;
import java.util.List;
import javax.persistence.Query;

/**
 *
 * @author sergi
 */
@Stateless
public class SesionBeanEJB {

    @PersistenceUnit
    EntityManagerFactory emf;
    
    public boolean insertarProducto(Producto p){
        if (!existeProducto(p)){
            EntityManager em = emf.createEntityManager();
            em.persist(p);
            em.close();
            return true;
        }else {
            return false;
        }
    }
    
    public boolean existeProducto(Producto p){
        EntityManager em = emf.createEntityManager();
        Query q = em.createNamedQuery("Producto.findByNombre");
        q.setParameter("nombre", p.getNombre());
        List<Producto> productos = q.getResultList();
        em.close();
        return !productos.isEmpty();
    }
}
