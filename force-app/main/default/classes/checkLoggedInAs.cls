public class checkLoggedInAs{
    public static Id getSubstituteUserId(){

        List<AuthSession> sessions = [SELECT IsCurrent, CreatedDate, Id, SessionType, UsersId, LoginHistory.UserId
                                      FROM AuthSession
                                      WHERE SessionType = 'SubstituteUser' AND CreatedDate >= :System.now().addHours(-2)

                                      ORDER BY CreatedDate DESC];
        if (sessions.size() > 0){
            for (AuthSession s : sessions){
                if (s.UsersId == System.UserInfo.getUserId()){
                    return s.LoginHistory.UserId;
                }
            }

        }

        return null;
    }

}