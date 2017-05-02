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
import entities.Usuario;
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

    public boolean insertarProducto(Producto p) {
        if (!existeProducto(p)) {
            EntityManager em = emf.createEntityManager();
            em.persist(p);
            em.close();
            return true;
        } else {
            return false;
        }
    }

    public boolean existeProducto(Producto p) {
        EntityManager em = emf.createEntityManager();
        Query q = em.createNamedQuery("Producto.findByNombre");
        q.setParameter("nombre", p.getNombre());
        List<Producto> productos = q.getResultList();
        em.close();
        return !productos.isEmpty();
    }

    public boolean createUser(Usuario u) {

        EntityManager em = emf.createEntityManager();
        boolean ok = false;
        Query q = em.createNamedQuery("Usuario.findByNombre");
        q.setParameter("nombre", u.getNombre());
        List<Usuario> users = q.getResultList();

        if (users.isEmpty()) {
            em.persist(u);
            ok = true;
        }
        em.close();

        return ok;
    }

    public List<Object[]> mostrarUsuarios() {
        EntityManager em = emf.createEntityManager();
        Query query = em.createQuery("select a.idUsuario, a.nombre from Usuario a");
        List<Object[]> classis = query.getResultList();

        return classis;
    }

    public boolean borrar(int a) {
        EntityManager em = emf.createEntityManager();
        Usuario usuario = em.find(Usuario.class, a);

        if (usuario != null) {
            em.remove(usuario);
            em.close();

            return true;
        } else {
            return false;
        }
    }

}
