%if you want to comment a line just add the percentage sign
%multiline comments require multiple % .-)
% if you are unsure how to use a function
% just type 
help sqrt;

%working with variables is also simple:
a = 3;
a = a + 4;
a = a * 0.321;

%we display a variable with disp(a) or look at it in
%the workspace

disp(a);

%working with strings in matlab is ... not really what this is meant for
string = 'Hallo';
string = [string, ' Welt!'];
disp(string)

%you might wonder if i can just add strings? ...
a = 'Hallo'
b = 'Welt!'
c = a + b;
disp(c)

%lists are very natural to matlab
myList = [1,1,2,3,5,8,13,42];
disp(myList)

%same with matrices
myMatrix = [1, 2, 3; 4, 5, 6; 7, 8, 9];
disp(myMatrix)

%want to try and write a union matrix that flips the y value??
union = [1,0,0; 0,-1,0; 0,0,1]

% lets apply a vector to it
vec = [3,2,5]
flipy = vec*union

%sometimes I need to do an element multiplication
elemmult = vec.*union

%structs are cool object like things to organize your workspace
myStruct.Key1 = 'Value 1';
myStruct.Key2 = 3;
myStruct.pi = 3.14;

disp(myStruct.pi)
disp(myStruct.Key1)
disp(myStruct.Key2)

%nested lists and their modification
myList = {1, {'another', 'list'}, {'a', 'tuple'}};
myList{1} = 'List item 1 again';
myList{3} = 'Updated value';
disp(myList)

%using arrays and doing slices ... watch out for () !!
data = [1, 1.1, 1.2; 2.1, 2.1, 2.6; 1.2, 5.2, 8.44; 5.6, 7.4, 5.45; 3.8, 3.8, 2.32];
disp(data)
disp(data(:, 2))
disp(data(2, :))

%naturally we can do formatted strings
fprintf('X: %.2f mm Y: %.2f mm Z: %.2f mm\n', 42, 23, 0.01);
fprintf('This %s a %s.\n', 'is', 'test');

%random numbers
zufallsZahl = randi([1, 5000]);
disp(zufallsZahl)

%looping works a little different
for a = 1:4
    disp(a)
end

rangelist = 0:9;
disp(rangelist)

%looping a little harder ...
for number = rangelist
    if ismember(number, [3, 4, 7, 9])
        break;
    end
end

%looping a little simpler
a = 0;
for number = 0:9
    a = a + number;
end

%add appending lists is super simple
erster = [1,2,3,4,5];
zweiter = [10, 100, 1000, 10000, 100000];
listComprehension = erster' * zweiter;

%functions are not supported in a script like this and need to be put in a
%separate file
%function z = myFunc(x, y)
%    z = x + y;
%end

%however we have anonymous functions
multiply = @(x, y) x .* y;

% Define an anonymous function for heat transfer calculation
calculate_final_temperature = @(Q, A, T1, h) T1 - Q / (h * A);

% Parameters
Q = 500; % heat transfer rate (Watts)
A = 2; % area (m^2)
T1 = 100; % initial temperature (°C)
h = 10; % heat transfer coefficient (W/m^2°C)

% Calculate final temperature
T2 = calculate_final_temperature(Q, A, T1, h);
disp(['Final temperature: ', num2str(T2), ' °C'])


% Parameters
F_in = 1; % inflow rate (L/min)
C_A0 = 1; % inflow concentration of A (mol/L)
V = 10; % volume of reactor (L)
k = 0.1; % rate constant (1/min)

syms C_A
% Define an anonymous function for CSTR calculation
calculate_CSTR = @(F_in, C_A0, V, k) double(solve(F_in * (C_A0 - C_A) - k * V * C_A == 0, C_A));

% Calculate steady-state concentration
C_A = calculate_CSTR(F_in, C_A0, V, k);
disp(['Steady-state concentration of A: ', num2str(C_A)])

% Define an anonymous function for squaring a number
square = @(x) x^2;

% Use the anonymous function
result = square(5);
disp(result) % Output should be 25

%ideal gas law
P = 101.325; % pressure in kPa
V = 1; % volume in liters
R = 8.314; % universal gas constant in J/(mol*K)
T = 298; % temperature in Kelvin

n = P * V / (R * T);
disp(['Number of moles: ', num2str(n)])


%%%%copy this code in a separate file and run it from here

% Main script to call the heat transfer function
Q = 500; % heat transfer rate (Watts)
A = 2; % area (m^2)
T1 = 100; % initial temperature (°C)
h = 10; % heat transfer coefficient (W/m^2°C)

T2 = calculate_final_temperature(Q, A, T1, h);
disp(['Final temperature: ', num2str(T2), ' °C'])

% Function definition
function T2 = calculate_final_temperature(Q, A, T1, h)
    % Calculate the final temperature after heat transfer
    % Q: heat transfer rate (Watts)
    % A: area (m^2)
    % T1: initial temperature (°C)
    % h: heat transfer coefficient (W/m^2°C)
    T2 = T1 - Q / (h * A);
end


% Data
x = linspace(0, 2*pi, 100);
y = sin(x);

% Create plot
figure;
plot(x, y);

% Modify plot
title('Sine Wave');
xlabel('x');
ylabel('sin(x)');
grid on;

%multi line plot
% Data
x = linspace(0, 2*pi, 100);
y1 = sin(x);
y2 = cos(x);

% Create plot
figure;
plot(x, y1, 'r', x, y2, 'b--');

% Modify plot
title('Sine and Cosine Waves');
xlabel('x');
ylabel('y');
legend('sin(x)', 'cos(x)');
grid on;

% Data
x = linspace(0, 2*pi, 100);
y1 = sin(x);
y2 = cos(x);

% Create subplots
figure;

subplot(2, 1, 1);
plot(x, y1, 'r');
title('Sine Wave');
xlabel('x');
ylabel('sin(x)');
grid on;

subplot(2, 1, 2);
plot(x, y2, 'b--');
title('Cosine Wave');
xlabel('x');
ylabel('cos(x)');
grid on;

%scatter 
% Data
x = randn(1, 100);
y = randn(1, 100);

% Create scatter plot
figure;
scatter(x, y, 'filled');

% Modify plot
title('Scatter Plot');
xlabel('x');
ylabel('y');
grid on;

%histogram
% Data
data = randn(1, 1000);

% Create histogram
figure;
histogram(data, 20);

% Modify plot
title('Histogram');
xlabel('Value');
ylabel('Frequency');
grid on;

%3D plot
% Data
[x, y] = meshgrid(linspace(-3, 3, 100));
z = peaks(x, y);

% Create 3D surface plot
figure;
surf(x, y, z);

% Modify plot
title('3D Surface Plot');
xlabel('x');
ylabel('y');
zlabel('z');
grid on;
colorbar;

% Data
x = linspace(0, 2*pi, 100);
y = sin(x);

% Create plot
figure;
plot(x, y, 'LineWidth', 2, 'Color', [0.5 0 0.5]);


%customizations
% Modify plot
title('Customized Sine Wave');
xlabel('x');
ylabel('sin(x)');

% Customizing axes
ax = gca;
ax.XColor = 'r';
ax.YColor = 'b';
ax.LineWidth = 1.5;
ax.FontSize = 12;
ax.GridLineStyle = '--';

% Add grid
grid on;
