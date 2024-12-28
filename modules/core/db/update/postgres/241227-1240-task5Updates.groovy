import com.company.garant.entity.CreditType;
import com.haulmont.cuba.core.EntityManager;
import com.haulmont.cuba.core.Persistence;
import com.haulmont.cuba.core.Transaction;
import com.haulmont.cuba.core.global.AppBeans;

postUpdate.add({
    Persistence p = AppBeans.get(Persistence.class)
    Transaction tr = p.createTransaction()
    try {
        EntityManager em = p.getEntityManager()

        CreditType creditType1 = new CreditType();
        creditType1.setName("Ипотека");
        creditType1.setCode("11");
        em.persist(creditType1);

        CreditType creditType2 = new CreditType();
        creditType2.setName("Кредит под залог недвижимости");
        creditType2.setCode("21");
        em.persist(creditType2);

        CreditType creditType3 = new CreditType();
        creditType3.setName("Автокредит");
        creditType3.setCode("31");
        em.persist(creditType3);

        CreditType creditType4 = new CreditType();
        creditType4.setName("Потребительские");
        creditType4.setCode("41");
        em.persist(creditType4);

        CreditType creditType5 = new CreditType();
        creditType5.setName("Рефинансирование");
        creditType5.setCode("51");
        em.persist(creditType5);

        CreditType creditType6 = new CreditType();
        creditType6.setName("Реструктуризация");
        creditType6.setCode("61");
        em.persist(creditType6);

        tr.commit();
    } catch (Exception e) {
        println("Error during standard db init " + e.getMessage());
    }
    finally {
        tr.end();
    }

    tr.close();
})
