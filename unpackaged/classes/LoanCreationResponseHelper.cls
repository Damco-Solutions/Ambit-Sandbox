public class LoanCreationResponseHelper {
    public static void SendDocument(string Response)
    {
       
        LoanCreationResponse loanCreationResponse=LoanCreationResponse.parse(Response);
    }

}