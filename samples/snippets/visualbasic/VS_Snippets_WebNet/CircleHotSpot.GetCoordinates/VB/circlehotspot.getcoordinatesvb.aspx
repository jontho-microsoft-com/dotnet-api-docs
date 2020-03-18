<!--<Snippet1>-->
<%@ Page Language="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

  Sub ShopMap_Clicked(ByVal sender As Object, ByVal e As ImageMapEventArgs)
    
    Dim coordinates As String
    
    ' When a user clicks the Circle1 hot spot,
    ' display the hot spot's coordinates.
    If (e.PostBackValue.ToString() = "Circle1") Then
      coordinates = Shop.HotSpots(0).GetCoordinates()
      Message1.Text = "The hot spot's coordinates are " & coordinates & "."
                     
      ' When a user clicks the Circle2 hot spot,
      ' display the hot spot's coordinates.
    ElseIf (e.PostBackValue.ToString() = "Circle2") Then
      coordinates = Shop.HotSpots(1).GetCoordinates()
      Message1.Text = "The hot spot's coordinates are " & coordinates & "."
      
    Else
      Message1.Text = "You did not click a valid hot spot region."
                
    End If
        
  End Sub
  
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="head1" runat="server">
  <title>CircleHotSpot.GetCoordinates Example</title>
</head>
  <body>
    <form id="form1" runat="server">
    
      <h3>CircleHotSpot.GetCoordinates Example</h3>
      
      <h4>Shopping Choices:</h4>
      
      <asp:imagemap id="Shop"           
        imageurl="Images/ShopChoice.jpg"
        width = "150"
        height = "360"
        onclick="ShopMap_Clicked"
        alternatetext="Shopping choices"
        runat="Server">    
        
        <asp:circlehotspot
          postbackvalue="Circle1"
          x="75"
          y="120"
          radius="75"
          hotspotmode="PostBack"
          alternatetext="Shop for toys.">           
        </asp:circlehotspot> 
        
        <asp:circlehotspot
          postbackvalue="Circle2"
          x="75"
          y="290"
          radius="75"
          hotspotmode="PostBack"
          alternatetext="Shop for wine.">           
        </asp:circlehotspot>     
          
      </asp:imagemap>          
      
      <br />
          
      <asp:label id="Message1"
        runat="Server">
      </asp:label>             
                 
    </form>      
  </body>
</html>
<!--</Snippet1>-->
