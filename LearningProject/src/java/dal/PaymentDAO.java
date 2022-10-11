/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author NamDepTraiVL
 */
public class PaymentDAO extends DBContext {

    public void userRecharge(int userid, Date date, int amount, int status, String method, String content) {
        execute("INSERT INTO [dbo].[Recharge]\n"
                + "           ([UserID]\n"
                + "           ,[RechargeDate]\n"
                + "           ,[Amount]\n"
                + "           ,[Status]\n"
                + "           ,[Method],[Content])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?,?)", userid, new Timestamp(date.getTime()), amount, status, method, content);
    }
}
