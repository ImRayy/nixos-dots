{
  self,
  inputs,
  ...
}: {
  perSystem = {pkgs, ...}: {
    packages = {
      noctalia-shell = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
        inherit pkgs;
        package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
        env = {
          "NOCTALIA_CACHE_DIR" = "/tmp/${self.preferences.username}-noctalia-cache/";
        };
        autoCopyConfig = true;
        outOfStoreConfig = "/home/${self.preferences.username}/.config/noctalia";

        settings = {
          appLauncher = {
            autoPasteClipboard = false;
            clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
            clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
            clipboardWrapText = true;
            customLaunchPrefix = "";
            customLaunchPrefixEnabled = false;
            density = "default";
            enableClipPreview = true;
            enableClipboardChips = false;
            enableClipboardHistory = true;
            enableClipboardSmartIcons = true;
            enableSessionSearch = true;
            enableSettingsSearch = true;
            enableWindowsSearch = true;
            iconMode = "tabler";
            ignoreMouseInput = false;
            overviewLayer = false;
            pinnedApps = [];
            position = "follow_bar";
            screenshotAnnotationTool = "";
            showCategories = false;
            showIconBackground = false;
            sortByMostUsed = true;
            terminalCommand = "foot -e";
            viewMode = "list";
          };

          audio = {
            mprisBlacklist = [];
            preferredPlayer = "";
            spectrumFrameRate = 30;
            spectrumMirrored = true;
            visualizerType = "linear";
            volumeFeedback = false;
            volumeFeedbackSoundFile = "";
            volumeOverdrive = false;
            volumeStep = 5;
          };

          bar = {
            autoHideDelay = 500;
            autoShowDelay = 150;
            backgroundOpacity = 0.93;
            barType = "framed";
            capsuleColorKey = "none";
            capsuleOpacity = 1;
            contentPadding = 2;
            density = "default";
            displayMode = "always_visible";
            enableExclusionZoneInset = true;
            fontScale = 0.86;
            frameRadius = 20;
            frameThickness = 8;
            hideOnOverview = false;
            marginHorizontal = 4;
            marginVertical = 4;
            middleClickAction = "none";
            middleClickCommand = "";
            middleClickFollowMouse = false;
            monitors = [];
            mouseWheelAction = "none";
            mouseWheelWrap = true;
            outerCorners = true;
            position = "top";
            reverseScroll = false;
            rightClickAction = "controlCenter";
            rightClickCommand = "";
            rightClickFollowMouse = true;
            screenOverrides = [];
            showCapsule = true;
            showOnWorkspaceSwitch = true;
            showOutline = false;
            useSeparateOpacity = false;
            widgetSpacing = 6;

            widgets = {
              center = [
                {
                  blacklist = [];
                  chevronColor = "none";
                  colorizeIcons = false;
                  drawerEnabled = true;
                  hidePassive = false;
                  id = "Tray";
                  pinned = [];
                }
                {
                  clockColor = "none";
                  customFont = "JetBrainsMono NF";
                  formatHorizontal = "HH:mm  •  ddd dd";
                  formatVertical = "HH mm - dd MM";
                  id = "Clock";
                  tooltipFormat = "HH:mm ddd, MMM dd";
                  useCustomFont = false;
                }
                {
                  defaultSettings = {
                    customColor = "none";
                    showConditionIcon = true;
                    showTempUnit = true;
                    showTempValue = true;
                    tooltipOption = "everything";
                  };
                  id = "plugin:weather-indicator";
                }
                {
                  compactMode = false;
                  hideMode = "hidden";
                  hideWhenIdle = false;
                  id = "MediaMini";
                  maxWidth = 200;
                  panelShowAlbumArt = true;
                  scrollingMode = "hover";
                  showAlbumArt = true;
                  showArtistFirst = true;
                  showProgressRing = false;
                  showVisualizer = false;
                  textColor = "none";
                  useFixedWidth = false;
                  visualizerType = "linear";
                }
              ];

              left = [
                {
                  colorizeSystemIcon = "none";
                  colorizeSystemText = "none";
                  customIconPath = "";
                  enableColorization = false;
                  icon = "rocket";
                  iconColor = "none";
                  id = "Launcher";
                  useDistroLogo = false;
                }
                {
                  characterCount = 2;
                  colorizeIcons = false;
                  emptyColor = "secondary";
                  enableScrollWheel = true;
                  focusedColor = "primary";
                  followFocusedScreen = false;
                  fontWeight = "bold";
                  groupedBorderOpacity = 1;
                  hideUnoccupied = false;
                  iconScale = 0.8;
                  id = "Workspace";
                  labelMode = "none";
                  occupiedColor = "secondary";
                  pillSize = 0.6;
                  showApplications = false;
                  showApplicationsHover = false;
                  showBadge = true;
                  showLabelsOnlyWhenOccupied = true;
                  unfocusedIconsOpacity = 1;
                }
                {
                  compactMode = false;
                  diskPath = "/";
                  iconColor = "none";
                  id = "SystemMonitor";
                  showCpuCores = false;
                  showCpuFreq = false;
                  showCpuTemp = false;
                  showCpuUsage = true;
                  showDiskAvailable = false;
                  showDiskUsage = false;
                  showDiskUsageAsPercent = false;
                  showGpuTemp = false;
                  showLoadAverage = false;
                  showMemoryAsPercent = false;
                  showMemoryUsage = true;
                  showNetworkStats = false;
                  showSwapUsage = false;
                  textColor = "none";
                  useMonospaceFont = false;
                  usePadding = false;
                }
                {
                  defaultSettings = {
                    cursorPosition = 0;
                    filePath = "";
                    fontSize = 14;
                    panelHeight = 400;
                    panelWidth = 600;
                    scratchpadContent = "";
                    scrollPositionX = 0;
                    scrollPositionY = 0;
                  };
                  id = "plugin:notes-scratchpad";
                }
                {
                  defaultSettings = {
                    refreshInterval = 5000;
                  };
                  id = "plugin:mini-docker";
                }
                {
                  defaultSettings = {
                    completedCount = 0;
                    count = 0;
                    current_page_id = 0;
                    exportEmptySections = false;
                    exportFormat = "markdown";
                    exportPath = "~/Documents";
                    isExpanded = false;
                    pages = [
                      {
                        id = 0;
                        name = "General";
                      }
                    ];
                    priorityColors = {
                      high = "#f44336";
                      low = "#9e9e9e";
                      medium = "#2196f3";
                    };
                    showBackground = true;
                    showCompleted = true;
                    todos = [];
                    useCustomColors = false;
                  };
                  id = "plugin:todo";
                }
              ];

              right = [
                {
                  compactMode = false;
                  diskPath = "/";
                  iconColor = "none";
                  id = "SystemMonitor";
                  showCpuCores = false;
                  showCpuFreq = false;
                  showCpuTemp = false;
                  showCpuUsage = false;
                  showDiskAvailable = false;
                  showDiskUsage = false;
                  showDiskUsageAsPercent = false;
                  showGpuTemp = false;
                  showLoadAverage = false;
                  showMemoryAsPercent = false;
                  showMemoryUsage = false;
                  showNetworkStats = true;
                  showSwapUsage = false;
                  textColor = "none";
                  useMonospaceFont = false;
                  usePadding = false;
                }
                {
                  hideWhenZero = false;
                  hideWhenZeroUnread = false;
                  iconColor = "none";
                  id = "NotificationHistory";
                  showUnreadBadge = true;
                  unreadBadgeColor = "primary";
                }
                {
                  displayMode = "onhover";
                  iconColor = "none";
                  id = "Volume";
                  middleClickCommand = "pwvucontrol || pavucontrol";
                  textColor = "none";
                }
                {
                  defaultSettings = {};
                  id = "plugin:kde-connect";
                }
                {
                  defaultSettings = {
                    ai = {
                      apiKeys = {};
                      maxHistoryLength = 100;
                      model = "gemini-2.5-flash";
                      openaiBaseUrl = "https://api.openai.com/v1/chat/completions";
                      openaiLocal = false;
                      provider = "google";
                      systemPrompt = "You are a helpful assistant integrated into a Linux desktop shell. Be concise and helpful.";
                      temperature = 0.7;
                    };
                    maxHistoryLength = 100;
                    panelDetached = true;
                    panelHeightRatio = 0.85;
                    panelPosition = "right";
                    panelWidth = 520;
                    scale = 1;
                    translator = {
                      backend = "google";
                      deeplApiKey = "";
                      realTimeTranslation = true;
                      sourceLanguage = "auto";
                      targetLanguage = "en";
                    };
                  };
                  id = "plugin:assistant-panel";
                }
                {
                  defaultSettings = {
                    audioCodec = "opus";
                    audioSource = "default_output";
                    colorRange = "limited";
                    copyToClipboard = false;
                    customReplayDuration = "30";
                    directory = "";
                    filenamePattern = "recording_yyyyMMdd_HHmmss";
                    frameRate = "60";
                    hideInactive = false;
                    iconColor = "none";
                    quality = "very_high";
                    replayDuration = "30";
                    replayEnabled = false;
                    replayStorage = "ram";
                    resolution = "original";
                    restorePortalSession = false;
                    showCursor = true;
                    videoCodec = "h264";
                    videoSource = "portal";
                  };
                  id = "plugin:screen-recorder";
                }
                {
                  defaultSettings = {
                    autoMount = false;
                    fileBrowser = "yazi";
                    hideWhenEmpty = false;
                    iconColor = "none";
                    showBadge = false;
                    showNotifications = true;
                    terminalCommand = "kitty";
                  };
                  id = "plugin:usb-drive-manager";
                }
                {
                  colorizeDistroLogo = false;
                  colorizeSystemIcon = "primary";
                  colorizeSystemText = "none";
                  customIconPath = "";
                  enableColorization = false;
                  icon = "layout-dashboard";
                  id = "ControlCenter";
                  useDistroLogo = false;
                }
              ];
            };
          };

          brightness = {
            backlightDeviceMappings = [];
            brightnessStep = 5;
            enableDdcSupport = false;
            enforceMinimum = true;
          };

          calendar = {
            cards = [
              {
                enabled = true;
                id = "calendar-header-card";
              }
              {
                enabled = true;
                id = "calendar-month-card";
              }
              {
                enabled = true;
                id = "weather-card";
              }
            ];
          };

          colorSchemes = {
            darkMode = true;
            generationMethod = "tonal-spot";
            manualSunrise = "06:30";
            manualSunset = "18:30";
            monitorForColors = "";
            predefinedScheme = "Gruvbox";
            schedulingMode = "off";
            syncGsettings = true;
            useWallpaperColors = false;
          };

          controlCenter = {
            cards = [
              {
                enabled = true;
                id = "profile-card";
              }
              {
                enabled = true;
                id = "shortcuts-card";
              }
              {
                enabled = true;
                id = "audio-card";
              }
              {
                enabled = false;
                id = "brightness-card";
              }
              {
                enabled = true;
                id = "weather-card";
              }
              {
                enabled = true;
                id = "media-sysmon-card";
              }
            ];
            diskPath = "/";
            position = "close_to_bar_button";
            shortcuts = {
              left = [
                {id = "Network";}
                {id = "Bluetooth";}
                {id = "WallpaperSelector";}
                {id = "NoctaliaPerformance";}
              ];
              right = [
                {id = "Notifications";}
                {id = "PowerProfile";}
                {id = "KeepAwake";}
                {id = "NightLight";}
              ];
            };
          };

          desktopWidgets = {
            enabled = true;
            gridSnap = false;
            gridSnapScale = true;
            monitorWidgets = [
              {
                name = "HDMI-A-1";
                widgets = [];
              }
            ];
            overviewEnabled = true;
          };

          dock = {
            animationSpeed = 1;
            backgroundOpacity = 1;
            colorizeIcons = false;
            deadOpacity = 0.6;
            displayMode = "auto_hide";
            dockType = "floating";
            enabled = false;
            floatingRatio = 1;
            groupApps = false;
            groupClickAction = "cycle";
            groupContextMenuMode = "extended";
            groupIndicatorStyle = "dots";
            inactiveIndicators = false;
            indicatorColor = "primary";
            indicatorOpacity = 0.6;
            indicatorThickness = 3;
            launcherIcon = "";
            launcherIconColor = "none";
            launcherPosition = "end";
            launcherUseDistroLogo = false;
            monitors = [];
            onlySameOutput = true;
            pinnedApps = [];
            pinnedStatic = false;
            position = "bottom";
            showDockIndicator = false;
            showLauncherIcon = false;
            sitOnFrame = false;
            size = 1;
          };

          general = {
            allowPanelsOnScreenWithoutBar = true;
            allowPasswordWithFprintd = false;
            animationDisabled = false;
            animationSpeed = 1;
            autoStartAuth = false;
            avatarImage = "~/.face";
            boxRadiusRatio = 1;
            clockFormat = "hh\\nmm";
            clockStyle = "digital";
            compactLockScreen = true;
            dimmerOpacity = 0.2;
            enableBlurBehind = true;
            enableLockScreenCountdown = true;
            enableLockScreenMediaControls = false;
            enableShadows = true;
            forceBlackScreenCorners = false;
            iRadiusRatio = 1;
            keybinds = {
              "keyDown" = ["Down" "Ctrl+N"];
              "keyEnter" = ["Return" "Enter"];
              "keyEscape" = ["Esc"];
              "keyLeft" = ["Left"];
              "keyRemove" = ["Del"];
              "keyRight" = ["Right"];
              "keyUp" = ["Up" "Ctrl+P"];
            };
            language = "";
            lockOnSuspend = true;
            lockScreenAnimations = true;
            lockScreenBlur = 0;
            lockScreenCountdownDuration = 10000;
            lockScreenMonitors = [];
            lockScreenTint = 0;
            passwordChars = true;
            radiusRatio = 1;
            reverseScroll = false;
            scaleRatio = 1;
            screenRadiusRatio = 1;
            shadowDirection = "bottom_right";
            shadowOffsetX = 2;
            shadowOffsetY = 3;
            showChangelogOnStartup = true;
            showHibernateOnLockScreen = false;
            showScreenCorners = false;
            showSessionButtonsOnLockScreen = true;
            smoothScrollEnabled = true;
            telemetryEnabled = false;
          };

          hooks = {
            colorGeneration = "";
            darkModeChange = "";
            enabled = false;
            performanceModeDisabled = "";
            performanceModeEnabled = "";
            screenLock = "";
            screenUnlock = "";
            session = "";
            startup = "";
            wallpaperChange = "";
          };

          idle = {
            customCommands = "[]";
            enabled = false;
            fadeDuration = 5;
            lockCommand = "";
            lockTimeout = 660;
            resumeLockCommand = "";
            resumeScreenOffCommand = "";
            resumeSuspendCommand = "";
            screenOffCommand = "";
            screenOffTimeout = 600;
            suspendCommand = "";
            suspendTimeout = 1800;
          };

          location = {
            analogClockInCalendar = false;
            autoLocate = false;
            firstDayOfWeek = -1;
            hideWeatherCityName = false;
            hideWeatherTimezone = false;
            name = "Ranaghat";
            showCalendarEvents = true;
            showCalendarWeather = true;
            showWeekNumberInCalendar = false;
            use12hourFormat = false;
            useFahrenheit = false;
            weatherEnabled = true;
            weatherShowEffects = true;
            weatherTaliaMascotAlways = false;
          };

          network = {
            bluetoothAutoConnect = true;
            bluetoothDetailsViewMode = "grid";
            bluetoothHideUnnamedDevices = false;
            bluetoothRssiPollIntervalMs = 60000;
            bluetoothRssiPollingEnabled = false;
            disableDiscoverability = false;
            networkPanelView = "wifi";
            wifiDetailsViewMode = "grid";
          };

          nightLight = {
            autoSchedule = true;
            dayTemp = "6500";
            enabled = false;
            forced = false;
            manualSunrise = "06:30";
            manualSunset = "18:30";
            nightTemp = "4000";
          };

          noctaliaPerformance = {
            disableDesktopWidgets = true;
            disableWallpaper = true;
          };

          notifications = {
            backgroundOpacity = 1;
            clearDismissed = true;
            criticalUrgencyDuration = 15;
            density = "default";
            enableBatteryToast = true;
            enableKeyboardLayoutToast = true;
            enableMarkdown = false;
            enableMediaToast = false;
            enabled = true;
            location = "top_right";
            lowUrgencyDuration = 3;
            monitors = [];
            normalUrgencyDuration = 8;
            overlayLayer = true;
            respectExpireTimeout = false;
            saveToHistory = {
              critical = true;
              low = true;
              normal = true;
            };
            sounds = {
              criticalSoundFile = "";
              enabled = false;
              excludedApps = "discord,firefox,chrome,chromium,edge";
              lowSoundFile = "";
              normalSoundFile = "";
              separateSounds = false;
              volume = 0.5;
            };
          };

          osd = {
            autoHideMs = 2000;
            backgroundOpacity = 1;
            enabled = true;
            enabledTypes = [0 1 2];
            location = "top_right";
            monitors = [];
            overlayLayer = true;
          };

          plugins = {
            autoUpdate = true;
            notifyUpdates = true;
          };

          sessionMenu = {
            countdownDuration = 10000;
            enableCountdown = true;
            largeButtonsLayout = "grid";
            largeButtonsStyle = true;
            position = "center";
            powerOptions = [
              {
                action = "lock";
                command = "hyprlock";
                countdownEnabled = true;
                enabled = true;
                keybind = "L";
              }
              {
                action = "suspend";
                command = "";
                countdownEnabled = true;
                enabled = false;
                keybind = "";
              }
              {
                action = "hibernate";
                command = "";
                countdownEnabled = true;
                enabled = false;
                keybind = "";
              }
              {
                action = "reboot";
                command = "";
                countdownEnabled = true;
                enabled = true;
                keybind = "R";
              }
              {
                action = "logout";
                command = "";
                countdownEnabled = true;
                enabled = true;
                keybind = "O";
              }
              {
                action = "shutdown";
                command = "";
                countdownEnabled = true;
                enabled = true;
                keybind = "P";
              }
              {
                action = "rebootToUefi";
                command = "";
                countdownEnabled = true;
                enabled = false;
                keybind = "";
              }
              {
                action = "userspaceReboot";
                command = "";
                countdownEnabled = true;
                enabled = false;
                keybind = "";
              }
            ];
            showHeader = true;
            showKeybinds = true;
          };

          settingsVersion = 59;

          systemMonitor = {
            batteryCriticalThreshold = 5;
            batteryWarningThreshold = 20;
            cpuCriticalThreshold = 90;
            cpuWarningThreshold = 80;
            criticalColor = "";
            diskAvailCriticalThreshold = 10;
            diskAvailWarningThreshold = 20;
            diskCriticalThreshold = 90;
            diskWarningThreshold = 80;
            enableDgpuMonitoring = false;
            externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
            gpuCriticalThreshold = 90;
            gpuWarningThreshold = 80;
            memCriticalThreshold = 90;
            memWarningThreshold = 80;
            swapCriticalThreshold = 90;
            swapWarningThreshold = 80;
            tempCriticalThreshold = 90;
            tempWarningThreshold = 80;
            useCustomColors = false;
            warningColor = "";
          };

          templates = {
            activeTemplates = [];
            enableUserTheming = false;
          };

          ui = {
            boxBorderEnabled = false;
            fontDefault = "Roboto";
            fontDefaultScale = 1;
            fontFixed = "JetBrainsMono NF";
            fontFixedScale = 1;
            panelBackgroundOpacity = 1;
            panelsAttachedToBar = true;
            scrollbarAlwaysVisible = true;
            settingsPanelMode = "centered";
            settingsPanelSideBarCardStyle = false;
            tooltipsEnabled = true;
            translucentWidgets = false;
          };

          wallpaper = {
            automationEnabled = false;
            directory = "~/Pictures/Wallpapers";
            enableMultiMonitorDirectories = false;
            enabled = true;
            favorites = [];
            fillColor = "#000000";
            fillMode = "crop";
            hideWallpaperFilenames = false;
            linkLightAndDarkWallpapers = true;
            monitorDirectories = [];
            overviewBlur = 0.4;
            overviewEnabled = false;
            overviewTint = 0.6;
            panelPosition = "center";
            randomIntervalSec = 300;
            setWallpaperOnAllMonitors = true;
            showHiddenFiles = true;
            skipStartupTransition = false;
            solidColor = "#1a1a2e";
            sortOrder = "name";
            transitionDuration = 1500;
            transitionEdgeSmoothness = 0.05;
            transitionType = ["fade" "disc" "stripes" "wipe" "pixelate" "honeycomb"];
            useOriginalImages = false;
            useSolidColor = false;
            useWallhaven = false;
            viewMode = "single";
            wallhavenApiKey = "";
            wallhavenCategories = "111";
            wallhavenOrder = "desc";
            wallhavenPurity = "100";
            wallhavenQuery = "";
            wallhavenRatios = "";
            wallhavenResolutionHeight = "";
            wallhavenResolutionMode = "atleast";
            wallhavenResolutionWidth = "";
            wallhavenSorting = "relevance";
            wallpaperChangeMode = "random";
          };
        };

        plugins = {
          sources = [
            {
              enabled = true;
              name = "Noctalia Plugins";
              url = "https://github.com/noctalia-dev/noctalia-plugins";
            }
          ];

          states = {
            "assistant-panel" = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
            "kaomoji-provider" = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
            "kde-connect" = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
            "mini-docker" = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
            "notes-scratchpad" = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
            "screen-recorder" = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
            "screenshot" = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
            "todo" = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
            "usb-drive-manager" = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
            "weather-indicator" = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
          };

          version = 2;
        };

        colors = {
          mError = "#fb4934";
          mHover = "#83a598";
          mOnError = "#282828";
          mOnHover = "#282828";
          mOnPrimary = "#282828";
          mOnSecondary = "#282828";
          mOnSurface = "#fbf1c7";
          mOnSurfaceVariant = "#ebdbb2";
          mOnTertiary = "#282828";
          mOutline = "#57514e";
          mPrimary = "#b8bb26";
          mSecondary = "#fabd2f";
          mShadow = "#282828";
          mSurface = "#282828";
          mSurfaceVariant = "#3c3836";
          mTertiary = "#83a598";
        };
      };
    };
  };
}
