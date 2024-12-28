import com.haulmont.thesis.core.entity.Bank;
import com.haulmont.cuba.core.EntityManager;
import com.haulmont.cuba.core.Persistence;
import com.haulmont.cuba.core.Transaction;
import com.haulmont.cuba.core.global.AppBeans;

postUpdate.add({
    Persistence p = AppBeans.get(Persistence.class)
    Transaction tr = p.createTransaction()
    try {
        EntityManager em = p.getEntityManager()

        Bank bank1 = new Bank();
        bank1.setName("bank 1");
        bank1.setBik("111111111");
        em.persist(bank1);

        Bank bank2 = new Bank();
        bank2.setName("bank 2");
        bank2.setBik("222222222");
        em.persist(bank2);

        Bank bank3 = new Bank();
        bank3.setName("bank 3");
        bank3.setBik("333333333");
        em.persist(bank3);

        tr.commit();
    } catch (Exception e) {
        println("Error during standard db init " + e.getMessage());
    }
    finally {
        tr.end();
    }

    tr.close();
})