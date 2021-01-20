﻿using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DsDashBoard.UTIL
{
    public static class MenuHelper
    {
        public static MvcHtmlString Menu(this HtmlHelper helper)
        {
            var menu = new ControlDisofi();
            var menulit = string.Empty;
            var datosUsuario = SessionVariables.SESSION_DATOS_USUARIO;

            if(menu.MenuUsuario(datosUsuario.IdTipo).Count > 0)
            {
                var urlMenu = menu.MenuUsuario(datosUsuario.IdTipo).ToList();
                menulit = menulit + "<ul class ='nav'>" +
                    "<li class ='nav-header'></li>";
                for(var i = 0; i <= urlMenu.Count; i++)
                {
                    if(i > urlMenu.Count)
                    {
                        break;
                    }
                    menulit = menulit + string.Format("<li class ='has-sub'>" +
                        "<a href ='javascript:;'" +
                        "<b class ='caret'</b>");
                    menulit = menulit + string.Format("<i class ='{0}'></i><span>{1}</span></a>", urlMenu[i].Clase,urlMenu[i].PieMenu);
                    menulit = menulit + string.Format("<ul class ='sub-menu'>");

                    var nombreModulo = urlMenu[i].PieMenu;

                    for(var x = 0; x <= i; x++)
                    {
                        if(i >= urlMenu.Count)
                        {
                            break;
                        }
                        if(nombreModulo == urlMenu[i].PieMenu)
                        {
                            menulit = menulit + string.Format("<li><a href ='../{2}/{1}'>{0}</a></li>",urlMenu[i].Titutlo,
                                urlMenu[i].Action, urlMenu[i].Controler);
                            i++;
                        }
                        else
                        {
                            i--;
                            break;
                        }
                    }
                    menulit = menulit + "</ul>";
                }
                menulit = menulit + "</li></ul>";
            }
            return new MvcHtmlString(menulit);
        }
    }
}