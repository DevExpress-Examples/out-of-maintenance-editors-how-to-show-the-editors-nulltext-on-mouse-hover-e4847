<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .nullText
        {
            color: gray !important;
        }
    </style>
    <script type="text/javascript">
        var clearValue = false;
        function OnTbInit(s, e) {
            ProcessNullText(s, "Default text");
        }
        function OnCbInit(s, e) {
            ProcessNullText(s, "Default item");
        }
        function OnDeInit(s, e) {
            ProcessNullText(s, "Default date");
        }

        function OnTextBoxGotFocus(s, e) {            
            if (s.GetValue() == "Default text")
                removeNullText(s);
        }

        function ProcessNullText(element, nulltext) {
            var input = element.GetInputElement();
            ASPxClientUtils.AttachEventToElement(input, "mouseover", function (event) {
                if (element.GetValue() == null) {
                    clearValue = true;
                    var input = element.GetInputElement();
                    input.value = nulltext;
                    input.className += " nullText";
                }
            });
            ASPxClientUtils.AttachEventToElement(input, "mouseout", function (event) {
                if (clearValue) {
                    removeNullText(element);
                }
            });
        }
        function removeNullText(element) {
            clearValue = false;
            var input = element.GetInputElement();
            input.value = null;
            input.className = input.className.replace(/ nullText/gi, "");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server">
                <Items>
                    <dx:LayoutItem Caption="TextBox">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E1" runat="server" Width="170px">
                                    <ClientSideEvents Init="OnTbInit" GotFocus="OnTextBoxGotFocus" />
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="ComboBox">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxComboBox ID="ASPxFormLayout1_E2" runat="server">
                                    <Items>
                                        <dx:ListEditItem Value="0" Text="Item 1" />
                                        <dx:ListEditItem Value="1" Text="Item 2" />
                                    </Items>
                                    <ClientSideEvents Init="OnCbInit"/>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="DateEdit">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxDateEdit ID="ASPxFormLayout1_E3" runat="server">
                                    <ClientSideEvents Init="OnDeInit" />
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
                <SettingsItems HorizontalAlign="Left" />
            </dx:ASPxFormLayout>
        </div>
    </form>
</body>
</html>
