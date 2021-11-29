︠852408e4-8fb6-425a-b169-1297ed12eades︠
sage: version()
︡d0ea8112-2b22-41b5-80d0-53f1811c9ffd︡{"stdout":"'SageMath version 9.4, Release Date: 2021-08-22'"}︡{"stdout":"\n"}︡{"done":true}
︠f5265f01-b360-4104-a81d-a0966424fcfes︠
sage: def simp_mat(A, dic={}):
        lista=[]
        for b in A.list():
            try:
                lista.append(b.subs(dic).factor())
            except:
                lista.append(b)
        try:
            return(matrix(A.nrows(),A.ncols(),lista))
        except:
            return(A)
︡c8a86994-887f-4d39-af99-660ed1c3f090︡{"done":true}
︠de5e01b6-03fa-491c-a8a5-6bf640694f65s︠
sage: def simp_form(phi, dic={}):
        return(sum([phi.interior_product(b).constant_coefficient().subs(dic).factor()*b
                    for b in E.basis()]))
︡f808235a-cba8-4327-bbf1-6cc35c297a01︡{"done":true}
︠12809729-34f7-4ad8-871b-a2bb959e7d50s︠
sage: n = 6
sage: E = ExteriorAlgebra(SR, 'e', n)
sage: _ = var("alpha")
sage: d = E.coboundary({
            (0,2): alpha*E.gens()[4],
            (0,3): alpha*E.gens()[5],
            (1,2): alpha*E.gens()[5],
            (1,3): -alpha*E.gens()[4],
        })
︡24edca38-002a-4229-8ff3-ebdb53cf7ddb︡{"done":true}
︠fd688800-a5f0-4d72-b89f-699394697b8ds︠
sage: mu = {(a,b): sum([d(c).interior_product(a*b)*c for c in E.gens()])
            for a in E.gens() for b in E.gens()}
︡499fe184-7e62-47f4-9fac-d26c376c99b0︡{"done":true}
︠f628fdfc-df37-45c4-86e4-f2983509fb1as︠
sage: def Lie(x,y):
        return(sum([x.interior_product(a).constant_coefficient()
                    *y.interior_product(b).constant_coefficient()*mu[(a,b)]
                    for a in E.gens() for b in E.gens()]))
︡f4c56e8c-3c38-45b9-8105-f10c2f5eed75︡{"done":true}
︠f316490d-05da-4035-a688-3bb208d79ac8s︠
sage: j = matrix(2, [0,-1,1,0])
sage: Jmat=block_diagonal_matrix([j for n in range(n/2)])
sage: J = E.lift_morphism(Jmat)
︡bba8c405-4f28-4063-a31e-7b471d060b89︡{"done":true}
︠9f9732c6-6246-4f4a-9de1-bb49f73db56as︠
sage: Nij={(a,b): Lie(J(a),J(b))-Lie(a,b)-J(Lie(J(a),b)+Lie(a,J(b)))
           for a in E.gens() for b in E.gens()}
sage: [Nij[(a,b)] for a in E.gens() for b in E.gens() if Nij[(a,b)]!=0]
︡3aa7a31d-5734-45ff-b3f7-83baff7adcf3︡{"stdout":"[]\n"}︡{"done":true}
︠6f1a1e94-54e7-4411-ae82-1396d51d902cs︠
sage: F = -J(d(sum([E.gens()[2*j]*J(E.gens()[2*j]) for j in range(n/2)])))
sage: F
︡d301bc0a-6e32-47a4-9589-a0537b125794︡{"stdout":"-alpha*e0*e2*e4 - alpha*e0*e3*e5 - alpha*e1*e2*e5 + alpha*e1*e3*e4\n"}︡{"done":true}
︠962542b8-27a8-49a5-9258-1ed4ec8c3becs︠
sage: S = {x: matrix(n,n,[-1/2*mu[(x,y)].interior_product(z).constant_coefficient()
                          -1/2*mu[(z,x)].interior_product(y).constant_coefficient()
                          -1/2*mu[(z,y)].interior_product(x).constant_coefficient()
                          for z in E.gens() for y in E.gens()]) for x in E.gens()}
︡59c9d0c2-31b7-42fe-aed2-ce86d644b805︡{"done":true}
︠b0added4-3073-4a6d-a91d-a2928b7214fcs︠
sage: for a in S.keys():
        print("S^\mu(%s)=%s\n" % (latex(a), latex(S[a])))

︡9fd01485-b1b9-42ea-a1c5-f224d5a54c98︡{"stdout":"S^\\mu( e_{0})=\\left(\\begin{array}{rrrrrr}\n0 & 0 & 0 & 0 & 0 & 0 \\\\\n0 & 0 & 0 & 0 & 0 & 0 \\\\\n0 & 0 & 0 & 0 & \\frac{1}{2} \\, \\alpha & 0 \\\\\n0 & 0 & 0 & 0 & 0 & \\frac{1}{2} \\, \\alpha \\\\\n0 & 0 & -\\frac{1}{2} \\, \\alpha & 0 & 0 & 0 \\\\\n0 & 0 & 0 & -\\frac{1}{2} \\, \\alpha & 0 & 0\n\\end{array}\\right)\n\nS^\\mu( e_{1})=\\left(\\begin{array}{rrrrrr}\n0 & 0 & 0 & 0 & 0 & 0 \\\\\n0 & 0 & 0 & 0 & 0 & 0 \\\\\n0 & 0 & 0 & 0 & 0 & \\frac{1}{2} \\, \\alpha \\\\\n0 & 0 & 0 & 0 & -\\frac{1}{2} \\, \\alpha & 0 \\\\\n0 & 0 & 0 & \\frac{1}{2} \\, \\alpha & 0 & 0 \\\\\n0 & 0 & -\\frac{1}{2} \\, \\alpha & 0 & 0 & 0\n\\end{array}\\right)\n\nS^\\mu( e_{2})=\\left(\\begin{array}{rrrrrr}\n0 & 0 & 0 & 0 & -\\frac{1}{2} \\, \\alpha & 0 \\\\\n0 & 0 & 0 & 0 & 0 & -\\frac{1}{2} \\, \\alpha \\\\\n0 & 0 & 0 & 0 & 0 & 0 \\\\\n0 & 0 & 0 & 0 & 0 & 0 \\\\\n\\frac{1}{2} \\, \\alpha & 0 & 0 & 0 & 0 & 0 \\\\\n0 & \\frac{1}{2} \\, \\alpha & 0 & 0 & 0 & 0\n\\end{array}\\right)\n\nS^\\mu( e_{3})=\\left(\\begin{array}{rrrrrr}\n0 & 0 & 0 & 0 & 0 & -\\frac{1}{2} \\, \\alpha \\\\\n0 & 0 & 0 & 0 & \\frac{1}{2} \\, \\alpha & 0 \\\\\n0 & 0 & 0 & 0 & 0 & 0 \\\\\n0 & 0 & 0 & 0 & 0 & 0 \\\\\n0 & -\\frac{1}{2} \\, \\alpha & 0 & 0 & 0 & 0 \\\\\n\\frac{1}{2} \\, \\alpha & 0 & 0 & 0 & 0 & 0\n\\end{array}\\right)\n\nS^\\mu( e_{4})=\\left(\\begin{array}{rrrrrr}\n0 & 0 & -\\frac{1}{2} \\, \\alpha & 0 & 0 & 0 \\\\\n0 & 0 & 0 & \\frac{1}{2} \\, \\alpha & 0 & 0 \\\\\n\\frac{1}{2} \\, \\alpha & 0 & 0 & 0 & 0 & 0 \\\\\n0 & -\\frac{1}{2} \\, \\alpha & 0 & 0 & 0 & 0 \\\\\n0 & 0 & 0 & 0 & 0 & 0 \\\\\n0 & 0 & 0 & 0 & 0 & 0\n\\end{array}\\right)\n\nS^\\mu( e_{5})=\\left(\\begin{array}{rrrrrr}\n0 & 0 & 0 & -\\frac{1}{2} \\, \\alpha & 0 & 0 \\\\\n0 & 0 & -\\frac{1}{2} \\, \\alpha & 0 & 0 & 0 \\\\\n0 & \\frac{1}{2} \\, \\alpha & 0 & 0 & 0 & 0 \\\\\n\\frac{1}{2} \\, \\alpha & 0 & 0 & 0 & 0 & 0 \\\\\n0 & 0 & 0 & 0 & 0 & 0 \\\\\n0 & 0 & 0 & 0 & 0 & 0\n\\end{array}\\right)\n\n"}︡{"stderr":":2: DeprecationWarning: invalid escape sequence \\m\n"}︡{"done":true}
︠769149d3-634c-4e0e-9501-cce97c665b38s︠
sage: _ = var("s")
sage: A = {x: simp_mat(matrix(n,n,[S[x][E.gens().index(y),E.gens().index(z)]
                                   +(s+1)/4*F.interior_product(x*J(y)*J(z)).constant_coefficient()
                                   +(s-1)/4*F.interior_product(x*y*z).constant_coefficient()
                                   for y in E.gens() for z in E.gens()])) for x in E.gens()}
︡54b3b3d3-f0f7-40af-bc09-bee4be8df423︡{"done":true}
︠79c0920e-62d0-40af-a767-b09b8f4c67a3s︠
sage: ACh = {x: simp_mat(A[x], {s:1}) for x in A.keys()}
︡cfb4f28f-d3f8-4a12-ac5d-fde7c4485291︡{"done":true}
︠64375ec1-4952-4beb-b1a7-05abae2c23abs︠
sage: Omega = {(x,y): simp_mat(A[y]*A[x]-A[x]*A[y]
                               -(sum([matrix(6,6,[mu[(x,y)].interior_product(c).constant_coefficient()*b
                                                  for b in A[c].list()])
                                      for c in E.gens()]) if not mu[(x,y)]==0 else zero_matrix(6)))
                               for x in E.gens() for y in E.gens()}
︡c628d2f1-c26a-4f74-afc4-bf196247dfcb︡{"done":true}
︠900e27b8-1910-4ebf-ac15-9567e987c233s︠
sage: OmegaCh = {b: simp_mat(Omega[b], {s:1}) for b in Omega.keys()}
show(OmegaCh)
︡0c1e35f6-f7e2-44b9-a72c-99e49f93474b︡{"html":"<div align='center'>$\\displaystyle \\left\\{\\left( e_{0},  e_{0}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{0},  e_{1}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{0},  e_{2}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{0},  e_{3}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{0},  e_{4}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{0},  e_{5}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{1},  e_{0}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{1},  e_{1}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{1},  e_{2}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{1},  e_{3}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{1},  e_{4}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{1},  e_{5}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{2},  e_{0}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{2},  e_{1}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{2},  e_{2}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{2},  e_{3}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{2},  e_{4}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{2},  e_{5}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{3},  e_{0}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{3},  e_{1}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{3},  e_{2}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{3},  e_{3}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{3},  e_{4}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{3},  e_{5}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{4},  e_{0}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{4},  e_{1}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{4},  e_{2}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{4},  e_{3}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{4},  e_{4}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{4},  e_{5}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{5},  e_{0}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{5},  e_{1}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{5},  e_{2}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{5},  e_{3}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{5},  e_{4}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right), \\left( e_{5},  e_{5}\\right) : \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right)\\right\\}$</div>"}︡{"done":true}
︠ac58b30e-a885-424b-9d4c-81e1b8c027e9s︠
sage: rho1 = 1/2*simp_mat(matrix(n,n,[sum([Omega[(E.gens()[i],E.gens()[j])][2*k,2*k+1]
                              for k in range(n/2)]) for i in range(n) for j in range(n)])
                              +matrix(n,n,[sum([J(E.gens()[i]).interior_product(u).constant_coefficient()
                              *J(E.gens()[j]).interior_product(v).constant_coefficient()
                              *Omega[(u,v)][2*k,2*k+1] for u in E.gens() for v in E.gens()
                              for k in range(n/2)]) for i in range(n) for j in range(n)]))
sage: rho2 = 1/2*(simp_mat(sum([Omega[(E.gens()[2*j],E.gens()[2*j+1])] for j in range(n/2)])
                           +sum([J(E.gens()[2*j]).interior_product(u).constant_coefficient()
                           *J(E.gens()[2*j+1]).interior_product(v).constant_coefficient()
                           *Omega[(u,v)] for u in E.gens() for v in E.gens() for j in range(n/2)])))
︡34db881b-9f86-4433-b797-61ac2e7dc6c7︡{"done":true}
︠2d248cac-0d9d-4796-bc12-db4a9f79c670s︠
show(rho1.simplify_full())
show(rho2)
︡ea96b0d8-2327-4b40-b773-741b197c66f3︡{"html":"<div align='center'>$\\displaystyle \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right)$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\left(\\begin{array}{rrrrrr}\n0 &amp; -\\frac{1}{2} \\, \\alpha^{2} {\\left(s - 1\\right)}^{2} &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n\\frac{1}{2} \\, \\alpha^{2} {\\left(s - 1\\right)}^{2} &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; -\\frac{1}{2} \\, \\alpha^{2} {\\left(s - 1\\right)}^{2} &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; \\frac{1}{2} \\, \\alpha^{2} {\\left(s - 1\\right)}^{2} &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; \\alpha^{2} {\\left(s - 1\\right)}^{2} \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; -\\alpha^{2} {\\left(s - 1\\right)}^{2} &amp; 0\n\\end{array}\\right)$</div>"}︡{"done":true}
︠d3907a3b-2e81-4a32-9feb-1d1309d1c7c4s︠
sage: rho1Ch = simp_mat(rho1, {s:1})
sage: rho2Ch = simp_mat(rho2, {s:1})
show(rho1Ch)
show(rho2Ch)
︡4a76e368-2245-442d-8beb-9485dd017a47︡{"html":"<div align='center'>$\\displaystyle \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right)$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\left(\\begin{array}{rrrrrr}\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 \\\\\n0 &amp; 0 &amp; 0 &amp; 0 &amp; 0 &amp; 0\n\\end{array}\\right)$</div>"}︡{"done":true}
︠a42b8e2d-d396-43ec-8cee-cc9cf2bcf4bbs︠
sage: scal1 = 2*sum([rho2[2*j,2*j+1] for j in range(n/2)]).factor().simplify_full()
sage: scal2 = 2*sum([rho1[2*j,2*j+1] for j in range(n/2)]).factor().simplify_full()
show(scal1)
show(scal2)
︡37fd982d-ffb4-4a2c-89c5-6292530b003d︡{"html":"<div align='center'>$\\displaystyle 0$</div>"}︡{"html":"<div align='center'>$\\displaystyle 0$</div>"}︡{"done":true}
︠739b21f0-484d-47c9-b75c-214b09b914f9︠









