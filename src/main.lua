Z_TimeScale = {};
addModEventListener(Z_TimeScale);

Z_TimeScale.MAX_DEFAULT_TIMESCALE = 120;
Z_TimeScale.EXTRA_TIME_SCALES = {
  250, 500, 1000,
  5000, 25000, 15000
};

Z_TimeScale.timeScaleIndex = 1;

function Z_TimeScale:loadMap(name)
  self.timeScaleIndex = 0;
end

function Z_TimeScale:keyEvent(unicode, sym, modifier, isDown)
  if ((unicode == Input.KEY_7) and (isDown)) then
    self.timeScaleIndex = 0;
  end

  if ((unicode == Input.KEY_8) and (isDown) and (g_currentMission.missionInfo.timeScale >= self.MAX_DEFAULT_TIMESCALE)) then
    self.timeScaleIndex = self.timeScaleIndex >= #self.EXTRA_TIME_SCALES and #self.EXTRA_TIME_SCALES or self.timeScaleIndex + 1;
    g_currentMission:setTimeScale(self.EXTRA_TIME_SCALES[self.timeScaleIndex]);
  end
end
