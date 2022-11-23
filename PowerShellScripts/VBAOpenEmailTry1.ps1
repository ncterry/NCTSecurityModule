<#
<<Open File Email.txt>>

Here is a potential solution, however, there are still many variables at play that can prevent an email being sent. The below VBA is inserted in the Document_Open event handler. The method is sending an email through the Outlook application so the user who opens the file would need to have that installed too.   
''' 
Option Explicit 
  
Private Sub Document_Open()    

    'only run when others open 
    If Application.userName <> "My Name" Then 

        With Application 
            .ScreenUpdating = False 
            .DisplayAlerts = False 
        End With 

         
        Dim outApp As Object 
        Dim outMail As Object 
        Dim strBody As String 
        Dim userName As String 

        Set outApp = CreateObject("Outlook.Application") 
        Set outMail = outApp.createitem(0) 

         
        userName = Application.userName 
        strBody = userName & " has opened my file" 

        With outMail 
            .To = "myEmail@myDomain.com" 
            .CC = "" 
            .BCC = "" 
            .Subject = "My file has been opened" 
            .Body = strBody 
            '.Display 
            .Send 
        End With 


        Set outMail = Nothing 
        Set outApp = Nothing 

        With Application 
            .ScreenUpdating = True 
            .DisplayAlerts = True 
        End With 
    End If 

End Sub 

''' 

'''
The above runs smoothly but I end up with a security warning on my laptop
(I am not sure if this is true across everyone else's).
However, hopefully this gives you a starting point for you to tinker with to get the complete results. 
'''
 
#>



