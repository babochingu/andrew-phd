%stats(curr_mat,curr_channel,features).data
function boxPlotProperties(stats)
for curr_property=1:4
    figure(curr_property)
    for curr_channel=1:4
        subplot(4,1,curr_channel)
        ylim([0,1]);
        ylim('manual');
        for curr_mat = 1:size(stats,1)
            data(:,curr_mat) = stats(curr_mat,curr_channel,curr_property).data;
        end        
        boxplot(data);
        switch curr_property
            case 1
                property = 'Contrast';
            case 2
                property = 'Correlation';
            case 3
                property = 'Energy';
            case 4
                property = 'Homogeneity';
        end
        switch curr_channel
            case 1
                channel = 'Channel R';
            case 2
                channel = 'Channel G';
            case 3
                channel = 'Channel B';
            case 4
                channel = 'Channel Gray';
        end
        string = [channel, '',property];
        title(string);
    end
end


