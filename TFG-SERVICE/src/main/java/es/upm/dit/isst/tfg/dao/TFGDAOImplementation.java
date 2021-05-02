package es.upm.dit.isst.tfg.dao;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import es.upm.dit.isst.tfg.model.TFG;

public class TFGDAOImplementation implements TFGDAO {
	
	private static TFGDAOImplementation instancia = null;
	private TFGDAOImplementation() {
		
	}
	
	public static TFGDAOImplementation getInstance() {
		if(null == instancia) instancia = new TFGDAOImplementation();
		return instancia;
	}
	
	@Override
	public TFG create(TFG tfg) {
		// Abrimos una sesion de Hibernate
		Session session = SessionFactoryService.get().openSession();
		// Abrimos una transaccion (obligamos a que la operacion se realice de forma atomica)
		session.beginTransaction();
		// Tratamos de crear un TFG (en un try-catch por si se produce algun error) ???????
		try {
			session.save(tfg);
		} catch(Exception e) {
			tfg=null;
		}
		// Cerramos la transaccion
		session.getTransaction().commit();
		// Cerramos la sesion de Hibernate. Esto es importante, porque sino no podremos volver a abrir una ????
		session.close();
		return tfg;
	}
	
	@Override
	public TFG read(String email) {
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		TFG tfg = session.get(TFG.class, email);
		session.getTransaction().commit();
		session.close();
		return tfg;
	}
	
	@Override
	public TFG update(TFG tfg) {
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		session.saveOrUpdate(tfg);
		session.getTransaction().commit();
		session.close();
		return tfg;
	}
	
	@Override
	public TFG delete(TFG tfg) {
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		session.delete(tfg);
		session.getTransaction().commit();
		session.close();
		return tfg;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<TFG> readAll() {
		List<TFG> tfgs = new ArrayList<TFG>();
		Session session = SessionFactoryService.get().openSession();
		session.beginTransaction();
		tfgs.addAll(session.createQuery("from TFG").list());
		session.getTransaction().commit();
		session.close();
		return tfgs;
	}
	
	@Override
	public List<TFG> readAll(String professor) {
		List<TFG> res = new ArrayList<TFG>();
		for(TFG tfg : this.readAll()) {
			if(tfg.getAdvisor().equals(professor)) {
				res.add(tfg);
			}
		}
		return res;
	}

}
