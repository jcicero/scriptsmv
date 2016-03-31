select p.cd_portlet,pt.ds_titulo,pt.ds_portlet,p.ds_sql from dbacp.portlet_sql p, dbacp.portlet pt
where p.cd_portlet = pt.cd_portlet
order by 1
