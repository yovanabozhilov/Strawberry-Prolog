% Made by Yovana Bozhilov
% University of Sofia, Faculty of Mathematics and Informatics

?- 

G_X := 800,
G_AMPLITUDE := 50,
G_MODE := 1,
G_OMEGA := 1,
G_TIME := 0,
G_TIMESTEP := 0.05,
G_CENTER_Y := 300,

window(title("Standing Wave on a String"), size(G_X, 600), paint_indirectly, backgr(rgb(0,0,0))).

win_func(init):-
  Timer := set_timer(_, G_TIMESTEP, update_time),
  menu(pop_up, action(change_amplitude), text("Change Amplitude")),
  menu(pop_up, action(change_mode), text("Change Mode")),
  menu(pop_up, action(change_frequency), text("Change Frequency")).

change_amplitude(init) :-
	menu(normal, action(amplitude1), text("Default: 50 px")),
	menu(normal, action(amplitude2), text("100 px")),
	menu(normal, action(amplitude3), text("150 px")),
	menu(normal, action(amplitude4), text("200 px")).
amplitude1(press):- G_AMPLITUDE := 50.
amplitude2(press):- G_AMPLITUDE := 100.
amplitude3(press):- G_AMPLITUDE := 150.
amplitude4(press):- G_AMPLITUDE := 200.

change_mode(init) :-
	menu(normal, action(mode1), text("Default: Fundamental Mode")),
	menu(normal, action(mode2), text("Second Harmonic")),
	menu(normal, action(mode3), text("Third Harmonic")),
	menu(normal, action(mode4), text("Fourth Harmonic")).
mode1(press):- G_MODE := 1.
mode2(press):- G_MODE := 2.
mode3(press):- G_MODE := 3.
mode4(press):- G_MODE := 4.

change_frequency(init) :-
	menu(normal, action(frequency1), text("Default: 1 rad/s")),
	menu(normal, action(frequency2), text("2 rad/s")),
	menu(normal, action(frequency3), text("3 rad/s")),
	menu(normal, action(frequency4), text("4 rad/s")).
frequency1(press):- G_OMEGA := 1.
frequency2(press):- G_OMEGA := 2.
frequency3(press):- G_OMEGA := 3.
frequency4(press):- G_OMEGA := 4.

update_time(end) :-
    G_TIME := G_TIME + G_TIMESTEP,
    update_window(_).

win_func(paint) :-
    pen(3, rgb(50, 100, 255)),
    for(X, 0, G_X - 1),
        XNorm := X / G_X,
        Y_Divergence := G_AMPLITUDE * sin(pi * G_MODE * XNorm) * cos(G_OMEGA * G_TIME),
        Y_Peak := G_CENTER_Y + Y_Divergence,
        line(X, G_CENTER_Y, X, Y_Peak),
    fail.
