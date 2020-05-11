classdef appGRB < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                matlab.ui.Figure
        SelectanImageButton     matlab.ui.control.Button
        UIAxes                  matlab.ui.control.UIAxes
        UIAxes2                 matlab.ui.control.UIAxes
        CompressButton          matlab.ui.control.Button
        SizeKBEditFieldLabel    matlab.ui.control.Label
        SizeKBEditField         matlab.ui.control.NumericEditField
        SizeKBEditField_2Label  matlab.ui.control.Label
        SizeKBEditField_2       matlab.ui.control.NumericEditField
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: SelectanImageButton
        function SelectanImageButtonPushed(app, event)
            global I1   % Created by Ajeet Kumar Yadav
            [filename, pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.tiff;';'*.*'},'Select an Image File');
          
            fullpathname = strcat(pathname,filename);
            I1 = imread(fullpathname);
            imshow(I1,'Parent',app.UIAxes);
            fileinfo = dir(filename);
            SIZE = fileinfo.bytes;

            Size1 = SIZE/1024;
            
            app.SizeKBEditField.Value = Size1; 
%%For first channel
%%
            
            
            
        end

        % Button pushed function: CompressButton
        function CompressButtonPushed(app, event)
            global I1
           
            I = I1(:,:,1);
            I = im2double(I);
            T = dctmtx(8);
            B = blkproc(I,[8 8],'P1*x*P2',T,T');
            mask = [1   1   1   1   0   0   0   0
                1   1   1   0   0   0   0   0
                1   1   0   0   0   0   0   0
                1   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0];
            B2 = blkproc(B,[8 8],'P1.*x',mask);
            I2 = blkproc(B2,[8 8],'P1*x*P2',T',T);
            %%For second channel
            %%
            I = I1(:,:,2);
            I = im2double(I);
            T = dctmtx(8);
            B = blkproc(I,[8 8],'P1*x*P2',T,T');
            mask = [1   1   1   1   0   0   0   0
                1   1   1   0   0   0   0   0
                1   1   0   0   0   0   0   0
                1   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0];
            B2 = blkproc(B,[8 8],'P1.*x',mask);
            I3 = blkproc(B2,[8 8],'P1*x*P2',T',T);
            %% 3 rd channel
            I = I1(:,:,3);
            I = im2double(I);
            T = dctmtx(8);
            B = blkproc(I,[8 8],'P1*x*P2',T,T');
            mask = [1   1   1   1   0   0   0   0
                1   1   1   0   0   0   0   0
                1   1   0   0   0   0   0   0
                1   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0];
            B2 = blkproc(B,[8 8],'P1.*x',mask);
            I4 = blkproc(B2,[8 8],'P1*x*P2',T',T);
            %%
            L =cat(3,I2,I3,I4);
            
            
            imwrite(L,'Compressed.jpg');
            
            size23= dir('Compressed.jpg');
            Size2 = (size23.bytes)/1024;
            %fprintf('The original is %f and compressed is %f',Size1,Size2);
            imshow(L,'Parent',app.UIAxes2);
            app.SizeKBEditField_2.Value = Size2;

        end

        % Callback function
        function SizeEditFieldValueChanged(app, event)
                 %app.SizeKBEditField_2.Value = Size2;
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0 1 0];
            app.UIFigure.Position = [100 100 731 392];
            app.UIFigure.Name = 'UI Figure';

            % Create SelectanImageButton
            app.SelectanImageButton = uibutton(app.UIFigure, 'push');
            app.SelectanImageButton.ButtonPushedFcn = createCallbackFcn(app, @SelectanImageButtonPushed, true);
            app.SelectanImageButton.BackgroundColor = [0 1 0];
            app.SelectanImageButton.FontWeight = 'bold';
            app.SelectanImageButton.FontColor = [1 0.4118 0.1608];
            app.SelectanImageButton.Position = [134 45 107 22];
            app.SelectanImageButton.Text = 'Select an Image';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Original Image')
            xlabel(app.UIAxes, '')
            ylabel(app.UIAxes, '')
            app.UIAxes.FontName = 'Arial';
            app.UIAxes.FontSize = 14;
            app.UIAxes.XTick = [];
            app.UIAxes.YTick = [];
            app.UIAxes.Color = [0.8 0.8 0.8];
            app.UIAxes.Position = [18 117 300 233];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.UIFigure);
            title(app.UIAxes2, 'Compressed Image')
            xlabel(app.UIAxes2, '')
            ylabel(app.UIAxes2, '')
            app.UIAxes2.FontSize = 14;
            app.UIAxes2.XTick = [];
            app.UIAxes2.YTick = [];
            app.UIAxes2.Color = [0.8 0.8 0.8];
            app.UIAxes2.Position = [394 117 313 233];

            % Create CompressButton
            app.CompressButton = uibutton(app.UIFigure, 'push');
            app.CompressButton.ButtonPushedFcn = createCallbackFcn(app, @CompressButtonPushed, true);
            app.CompressButton.BackgroundColor = [0 1 0];
            app.CompressButton.FontWeight = 'bold';
            app.CompressButton.FontColor = [1 0.0745 0.651];
            app.CompressButton.Position = [521 45 100 22];
            app.CompressButton.Text = 'Compress';

            % Create SizeKBEditFieldLabel
            app.SizeKBEditFieldLabel = uilabel(app.UIFigure);
            app.SizeKBEditFieldLabel.HorizontalAlignment = 'right';
            app.SizeKBEditFieldLabel.FontWeight = 'bold';
            app.SizeKBEditFieldLabel.FontAngle = 'italic';
            app.SizeKBEditFieldLabel.FontColor = [0.149 0.149 0.149];
            app.SizeKBEditFieldLabel.Position = [62 96 55 22];
            app.SizeKBEditFieldLabel.Text = 'Size(KB)';

            % Create SizeKBEditField
            app.SizeKBEditField = uieditfield(app.UIFigure, 'numeric');
            app.SizeKBEditField.FontWeight = 'bold';
            app.SizeKBEditField.FontAngle = 'italic';
            app.SizeKBEditField.FontColor = [0.149 0.149 0.149];
            app.SizeKBEditField.Position = [132 96 109 22];

            % Create SizeKBEditField_2Label
            app.SizeKBEditField_2Label = uilabel(app.UIFigure);
            app.SizeKBEditField_2Label.HorizontalAlignment = 'right';
            app.SizeKBEditField_2Label.FontWeight = 'bold';
            app.SizeKBEditField_2Label.FontAngle = 'italic';
            app.SizeKBEditField_2Label.Position = [451 96 55 22];
            app.SizeKBEditField_2Label.Text = 'Size(KB)';

            % Create SizeKBEditField_2
            app.SizeKBEditField_2 = uieditfield(app.UIFigure, 'numeric');
            app.SizeKBEditField_2.Position = [521 96 100 22];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = appGRB

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end