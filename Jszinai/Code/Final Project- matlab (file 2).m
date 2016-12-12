%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[county_s,county_a] = shaperead('CaliforniaCounty.shp','UseGeoCoords', true)

%converting the shape file to proper lat lon coordinates
for i=1:length(county_s)
    [A,B] = sp_proj('california 3','inverse',county_s(i).Lon,county_s(i).Lat,'sf');
    county_s(i).Lon2 = A;
    county_s(i).Lat2 = B;
end

%load in station data using import wizard

%plotting the counties with the locations of the chargers, with Level 2

%animation of weekday:

n=1:1:24;
nImages = length(n)

figure
filename = 'ChargingUtilizationWeekday.gif';
for idx = 1:nImages
%Plotting county outlines  
    for l=1:length(county_s)
        plot(county_s(l).Lon,county_s(l).Lat,'k')
        hold on
        xlim([-125 -113])
        ylim([32 42.5])
    end
%indexing percent usage for each hour, and cooresponding lat, long    
        k = find(Hourf==idx-1);
        longitude_hour = longitude(k,:);
        latitude_hour = latitude(k,:);
        Perc_in_use_hour = Perc_in_use(k,:);
        
%mapping percent utilization to colors, and plotting for each charging station                
        zmin=min(Perc_in_use_hour);
        zmax=max(Perc_in_use_hour);
        map=colormap;
        color_steps=size(map,1);
        for j=1:color_steps
            ind=find(Perc_in_use_hour<zmin+j*(zmax-zmin)/color_steps & Perc_in_use_hour>=zmin+(j-1)*(zmax-zmin)/color_steps);
            plot(longitude_hour(ind),latitude_hour(ind),'.','Color',map(j,:));
            colorbar
            str = sprintf('EV Charging Station Average Weekday Utilization Rate: Hour %d',round(idx,0));
            title(str);
            axis off
            hold on
        end
 %Recording frames for annimated GIF       
    drawnow
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if idx == 1;
      imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
    else
      imwrite(imind,cm,filename,'gif','WriteMode','append');
    end
end

%import weekend data from wizard

%animation of weekend:

n=1:1:24;
nImages = length(n)

figure
filename = 'ChargingUtilizationWeekend.gif';
for idx = 1:nImages
%Plotting county outlines  
    for l=1:length(county_s)
        plot(county_s(l).Lon,county_s(l).Lat,'k')
        hold on
        xlim([-125 -113])
        ylim([32 42.5])
    end
%indexing percent usage for each hour, and cooresponding lat, long    
        k = find(Hourf==idx-1);
        longitude_hour = longitude(k,:);
        latitude_hour = latitude(k,:);
        Perc_in_use_hour = Perc_in_use(k,:);
        
%mapping percent utilization to colors, and plotting for each charging station                
        zmin=min(Perc_in_use_hour);
        zmax=max(Perc_in_use_hour);
        map=colormap;
        color_steps=size(map,1);
        for j=1:color_steps
            ind=find(Perc_in_use_hour<zmin+j*(zmax-zmin)/color_steps & Perc_in_use_hour>=zmin+(j-1)*(zmax-zmin)/color_steps);
            plot(longitude_hour(ind),latitude_hour(ind),'.','Color',map(j,:));
            colorbar
            str = sprintf('EV Charging Station Average Weekend Utilization Rate: Hour %d',round(idx,0));
            title(str);
            axis off
            hold on
        end
 %Recording frames for annimated GIF       
    drawnow
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if idx == 1;
      imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
    else
      imwrite(imind,cm,filename,'gif','WriteMode','append');
    end
end
