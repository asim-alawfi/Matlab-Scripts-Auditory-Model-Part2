clear;
    base=[pwd(),'\..\ddebiftool_snapshot_23October2022\'];
    base2=[pwd(),'\..\Supporting_function\'];
    addpath([base,'ddebiftool'],...
            [base,'ddebiftool_extra_psol'],...
            [base,'ddebiftool_utilities'],...
            [base,'ddebiftool_extra_rotsym'],...
            [base,'ddebiftool_extra_nmfm'],...
            [base,'ddebiftool_extra_symbolic'],...
            [base,'ddebiftool_coco']);
addpath([base2,'Supporting_functions'])
%%
load('asymmetric_branches_case12.mat')
%%
set_one_bif={'FontWeight','bold','FontSize',12,'FontName','Aril'};
codprojmat=[1,0,0,0,0,0];
%%  Plotting for one-parameter branch for $(t_\mathrm{d }, D) = (0.05,0.015)$
Scond=dde_lincond_struct(size(asym_brs1_wbifs.point(1).profile,1),'profile',...
    'shift',[1,2],'condprojmat',codprojmat,'condprojint',[0,0.5],'trafo',Rsym);
rp_asy1=arrayfun(@(x)x.parameter(in.PR),asym_brs1_wbifs.point);
yaxis_asy1=arrayfun(@(x)dde_psol_lincond(x,Scond),asym_brs1_wbifs.point);
rp1_sx=arrayfun(@(x)x.parameter(in.PR),br_symmetry_wbifs(1).point);
max1_sy=arrayfun(@(x)dde_psol_lincond(x,Scond),br_symmetry_wbifs(1).point);
%
figure(1)
clf;
hold on
plot(rp1_sx(nunst_po{1}'==0),max1_sy(nunst_po{1}'==0),'b.',rp1_sx(nunst_po{1}'>=1),max1_sy(nunst_po{1}'>=1),'k.','MarkerSize',7)
plot(rp_asy1(nunst_1==0),yaxis_asy1(nunst_1==0),'g.',rp_asy1(nunst_1>=1),yaxis_asy1(nunst_1>=1),'r.','MarkerSize',7)
plot(rp1_x(p_bif(:,1)),max1_sy(p_bif(:,1)),'k.','MarkerSize',25)
title(' $(t_\mathrm{d }, D) = (0.05,0.015)$','interpreter','latex','FontSize',16)
legend('stable symmetric POs','unstable symmetric POs','stable non-symmetric POs','symmetry-breaking Bif','')
xlabel('$r_\mathrm{p}$','FontName','Courier','Interpreter','latex','FontSize',12)
set(gca,set_one_bif{:})
grid on
%% Plotting for one-parameter branch for $(t_\mathrm{d }, D) = (0.05,0.05)$
rp2_sx=arrayfun(@(x)x.parameter(in.PR),br_symmetry_wbifs(2).point);
max2_sy=arrayfun(@(x)dde_psol_lincond(x,Scond),br_symmetry_wbifs(2).point);
rp_asy2=arrayfun(@(x)x.parameter(in.PR),asym_brs2_wbifs.point);
yaxis_asy2=arrayfun(@(x)dde_psol_lincond(x,Scond),asym_brs2_wbifs.point);
%
figure(2)
clf;
hold on
plot(rp2_sx(nunst_po{2}'==0),max2_sy(nunst_po{2}'==0),'b.',rp2_sx(nunst_po{2}'>=1),max2_sy(nunst_po{2}'>=1),'k.','MarkerSize',7)
plot(rp_asy2(nunst_td==0),yaxis_asy2(nunst_td'==0),'g.',rp_asy2(nunst_td>=1),yaxis_asy2(nunst_td>=1),'r.','MarkerSize',7)
plot(rp2_x(p_bif(:,2)),max2_sy(p_bif(:,2)),'k.','MarkerSize',25)
title('$(t_\mathrm{d }, D) = (0.05,0.05)$','interpreter','latex','FontSize',16)
legend('stable symmetric POs','unstable symmetric POs','stable non-symmetric POs','symmetry-breaking Bif','')
xlabel('$r_\mathrm{p}$','FontName','Courier','Interpreter','latex','FontSize',12)
set(gca,set_one_bif{:})
grid on
%%  Plotting for one-parameter branch for $(t_\mathrm{d }, D) = (0.022,0.05)$
load('asymm_brD.mat')
rp1_Dx=arrayfun(@(x)x.parameter(in.PR),asym_prD_wbifs.point);
max1_Dy=arrayfun(@(x)dde_psol_lincond(x,Scond),asym_prD_wbifs.point);

rp1_sx=arrayfun(@(x)x.parameter(in.PR),br_symmetry_wbifs(3).point);
max1_sy=arrayfun(@(x)dde_psol_lincond(x,Scond),br_symmetry_wbifs(3).point);
%
figure(3)
clf
hold on
plot(rp1_Dx(nunst_poD==0),max1_Dy(nunst_poD==0),'g.', ...
    rp1_Dx(nunst_poD>=1),max1_Dy(nunst_poD>=1),'r.','MarkerSize',7)
plot(rp1_sx(nunst_po{3}'==0),max1_sy(nunst_po{3}'==0),'b.', ...
    rp1_sx(nunst_po{3}'>=1),max1_sy(nunst_po{3}'>=1),'k.','MarkerSize',7)
grid on
plot(rp3_x(p_bif(:,3)),max1_sy(p_bif(:,3)),'k.',...
    rp1_Dx(p_bifD(2)),max1_Dy(p_bifD(2)),'b.',...
    rp1_Dx(p_bifD(1)),max1_Dy(p_bifD(1)),'r.',...
    rp1_Dx(p_bifD(3)),max1_Dy(p_bifD(3)),'b.',...
    rp1_Dx(p_bifD(4)),max1_Dy(p_bifD(4)),'b.',...
    rp1_Dx(p_bifD(5)),max1_Dy(p_bifD(5)),'b.',...
    rp1_Dx(p_bifD(6)),max1_Dy(p_bifD(6)),'r.',...
    'MarkerSize',25)
legend('asym stable POs','asym untsable POs','sym stable POs','sym untsable POs',...
    'symmetry-breaking','period doubling bifurcation','fold of POs')
title(' $(t_\mathrm{d }, D) = (0.022,0.05)$','interpreter','latex','FontSize',16)
xlabel('$r_\mathrm{p}$','FontName','Courier','Interpreter','latex','FontSize',12)
ylabel('$\int_0^{1/2}u_B(t)-u_A(t+1/2)\mathrm{d}t$','interpreter','latex','FontSize',16);
set(gca,set_one_bif{:})%set(gca,"FontWeight",'bold')
grid on
%%

