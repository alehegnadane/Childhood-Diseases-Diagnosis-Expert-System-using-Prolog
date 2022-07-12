%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Childhood disease and treatment to keep your child healthy.
%by Alehegn Adane
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

notice:-
nl, nl,
write('         UNIVERSITY OF GONDAR               '),nl,
write('       COLLEGE OF NATURAL AND COMPUTATIONAL SCIENCE         '),nl,
write('       Department of Information Technology(MSC PROG)         '),nl,
write('        Project on Artifical Intelligence         '),nl,
write('       WellCome To Childhood Diseases Diagnosing System         '),nl,
write('    ----------------------------------------------'),nl,
write('                                          By Alehegn Adane'),nl, nl,
write('To use this system, Read the questions carfully and answer correctly by write Y or N.'),nl,
nl.

disease(Child, common_cold):-
						symptom(Child, headache),
						symptom(Child, sneezing),
						symptom(Child, sore_throat),
						symptom(Child, chills),
						symptom(Child, runny_nose).

								
disease(Child, asthma):-
						symptom(Child, wheezing),
						symptom(Child, wheezing),
						symptom(Child, breathlessness),
						symptom(Child, chest_tightness),
                                                symptom(Child, night_or_early_times_coughing).				
disease(Child, measels):-
						symptom(Child, fever),
						symptom(Child, cough),
						symptom(Child, conjunctivitis),
						symptom(Child, rash).
						

disease(Child, flu):-
						symptom(Child, fever),
						symptom(Child, headache),
						symptom(Child, body_ache),
						symptom(Child, chills).
						
disease(Child, chicken_pox):-
						symptom(Child, fever),
						symptom(Child, rash),
						symptom(Child, body_ache),
						symptom(Child, chills).
												
disease(Child, mumps):-
						symptom(Child, fever),
						symptom(Child, swollen_glands).
						

disease(Child, german_measles):-
						symptom(Child, fever),
						symptom(Child, headache),
						symptom(Child, runny_nose),
						symptom(Child, rash).
						
disease(Child, runny_nose):-
						symptom(Child, rash),
						symptom(Child, flu).
						
								
						
						
						/*Ask rules*/

symptom(P, Val):-ask('Does the child have',Val).
ask(Obj, Val):-known(Obj, Val, true),!.
ask(Obj, Val):-known(Obj, Val, false),!, fail.
ask(Obj, Val):-nl,write(Obj),write(' '),
			write( Val) , write('?(y/n)'), read(Ans), !,
			((Ans=y, assert(known(Obj, Val, true)));(assert(known(Obj, Val, false)),fail)).
			
diagnose:- nl, disease(symptom,Disease) ,!,nl,
			write('That Child disease could be '), write(Disease).
diagnose:- nl, write('Sorry,we may not be able to diagnose the desease!!').

start:-notice, repeat, abolish(known/3),dynamic(known/3), retractall(known/3), diagnose,nl,nl, write('Try again ? (y/n)'),read(Resp),\+ Resp=y,
		nl,write('Bye ! Thanks for using this system'),abolish(known,3) .
		
		