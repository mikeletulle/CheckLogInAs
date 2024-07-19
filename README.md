# CheckLogInAs
 
This is basically an example of using an Apex class to see if the current user is actually a 'Logged In As' user and if returns the impersonating user's Id. 
It has a custom object called Field Change related to Opportunites that has fields such as 'Previous Value', 'New Value', 'Logged In User' and 'Actual User'
It uses an After Update trigger on Opportunities that checks to see if it's Stage field has changed and if so creates one of these records.
