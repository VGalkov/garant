import com.company.garant.entity.Target;
import com.haulmont.cuba.core.EntityManager;
import com.haulmont.cuba.core.Persistence;
import com.haulmont.cuba.core.Transaction;
import com.haulmont.cuba.core.global.AppBeans;

postUpdate.add({
    Persistence p = AppBeans.get(Persistence.class)
    Transaction tr = p.createTransaction()
    try {
        EntityManager em = p.getEntityManager()

        Target target1 = new Target();
        target1.setName("goal 1");
        target1.setCode("1");
        em.persist(target1);

        Target target2 = new Target();
        target2.setName("goal 2");
        target2.setCode("2");
        em.persist(target2);

        Target target3 = new Target();
        target3.setName("goal 3");
        target3.setCode("3");
        em.persist(target3);

        tr.commit();
    } catch (Exception e) {
        println("Error during standard db init " + e.getMessage());
    }
    finally {
        tr.end();
    }

    tr.close()
})