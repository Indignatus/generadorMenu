/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import entities.Menu;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import entities.Producto;
import entities.Usuario;
import java.util.List;
import javax.persistence.Query;


@Stateless
public class SesionBeanEJB {

    @PersistenceUnit
    EntityManagerFactory emf;
    
    
    public boolean login(String name, String pass) {
        EntityManager em = emf.createEntityManager();
        Query q = em.createQuery("select u from Usuario u where u.nombre = :x and u.pass = :y ");
        q.setParameter("x", name);
        q.setParameter("y", pass);
        q.getResultList();

        List<Usuario> users = q.getResultList();

        if (users.isEmpty()) {
            return false;
        } else {
            return true;
        }

    }
    
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
    
    public List<Producto> mostrarProducto() {
        EntityManager em = emf.createEntityManager();
        Query query = em.createQuery("select p from Producto p");
        List<Producto> producto = query.getResultList();

        return producto;
    }
    
        public List<Menu> mostrarMenu() {
        EntityManager em = emf.createEntityManager();
        Query query = em.createQuery("select m from Menu m");
        List<Menu> menu = query.getResultList();

        return menu;
    }
    
    public List<Menu> mostrarMenuPorSemana(String diaSemana) {
        EntityManager em = emf.createEntityManager();
        Query query = em.createQuery("select m from Menu m where m.semana = :se");
       query.setParameter("se", diaSemana);
        List<Menu> menu = query.getResultList();

        return menu;
    }
    
    public boolean modificarProducto(Producto p) {
        EntityManager em = emf.createEntityManager();
        Producto modifProducto = em.find(Producto.class, p.getIdProducto());
        boolean ok = false;
        if(modifProducto != null){
            modifProducto.setNombre(p.getNombre());
            modifProducto.setCantidad(p.getCantidad());
            modifProducto.setPrecio(p.getPrecio());
            em.persist(modifProducto);
            ok = true;
        }
        em.close();
        return ok;
    }
    
        public boolean borrarProducto (Producto p){
        EntityManager em = emf.createEntityManager();
        Producto producto = em.find(Producto.class, p.getIdProducto());
        boolean ok = false;
        if(producto != null){
            em.remove(producto);
            ok = true;
        }
        em.close();
        return ok;
    }
        
        public boolean borrarMenu (Menu m){
        EntityManager em = emf.createEntityManager();
        Menu menu = em.find(Menu.class, m.getIdMenu());
        boolean ok = false;
        if(menu != null){
            em.remove(menu);
            ok = true;
        }
        em.close();
        return ok;
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
        
            public Producto buscarProductoById(int num) {
//
//        Producto producto = new Producto();
//        EntityManager em = emf.createEntityManager();
//        Query q = em.createNamedQuery("Producto.findByIdProducto");
//        q.setParameter("idProducto", num);

        return emf.createEntityManager().find(Producto.class, num);
    }
    
    public boolean existeProducto(Producto p){
        EntityManager em = emf.createEntityManager();
        Query q = em.createNamedQuery("Producto.findByNombre");
        q.setParameter("nombre", p.getNombre());
        List<Producto> productos = q.getResultList();
        em.close();
        return !productos.isEmpty();
    }
    
    public boolean createMenu(Menu menu) {
         EntityManager em = emf.createEntityManager();
        boolean ok = false;
        Query q = em.createNamedQuery("Menu.findByNombre");
        q.setParameter("nombre", menu.getNombre());
        List<Menu> menus = q.getResultList();

        if (menus.isEmpty()) {
            em.persist(menu);
            ok = true;
        }
        em.close();

        return ok;
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
           
           public List<Producto> selectAllProductos(){
               return emf.createEntityManager().createNamedQuery("Producto.findAll").getResultList();
           }
}
