{ pkgs ? import <nixpkgs> { } }: {
  oh-my-zsh = [
    "git"
    "pip"
    "autojump"
    "command-not-found"
    "fasd"
    "battery"
    "history"
    "fzf"
  ];
  extras = [
    {
      name = "zsh-interactive-cd";
      src = pkgs.fetchFromGitHub {
        owner = "changyuheng";
        repo = "zsh-interactive-cd";
        rev = "2859ca705d544bf96c0494f65840f750322f1200";
        sha256 = "133z4bsiqkyj2gfs4jc31kc4ficn79d1fhrz53vym92fhp47ack5";
      };
    }
    {
      name = "zsh-history-substring-search";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-history-substring-search";
        rev = "0f80b8eb3368b46e5e573c1d91ae69eb095db3fb";
        sha256 = "0y8va5kc2ram38hbk2cibkk64ffrabfv1sh4xm7pjspsba9n5p1y";
      };
    }
    {
      name = "zsh-syntax-highlighting";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-syntax-highlighting";
        rev = "e7d3fbc50b0209cb9f9b0812fd40298be03c7808";
        sha256 = "14sfbnl8iw1l1ixzg8al190hcxyakgb1sf8qqd64n7adrq8vfiv6";
      };
    }
    {
      name = "fzf-widgets";
      src = pkgs.fetchFromGitHub {
        owner = "ytet5uy4";
        repo = "fzf-widgets";
        rev = "cf19c0b2be11520619aa503f7c3a1fb5a8556fbe";
        sha256 = "0agnzf20w3f138pkl2chc6kyszpm3zby4aqjag3jqlmswsc1zz1w";
      };
    }
    {
      name = "zsh-async";
      src = pkgs.fetchFromGitHub {
        owner = "mafredri";
        repo = "zsh-async";
        rev = "95c2b1577f455728ec01cec001a86c216d0af2bd";
        sha256 = "0kp94pqpy7qbmy51s6iwpnc96a1aq0nmmdp5fgssksan070hnw96";
      };
    }
    {
      name = "pure";
      src = pkgs.fetchFromGitHub {
        owner = "sindresorhus";
        repo = "pure";
        rev = "2e354b80deae105ea246699c49e65dcd4fe8b759";
        sha256 = "0nzvb5iqyn3fv9z5xba850mxphxmnsiq3wxm1rclzffislm8ml1j";
      };
    }
    {
      name = "zsh-completions";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-completions";
        rev = "8def5f15835f294ec6a1bf220fb330efddbe2575";
        sha256 = "1rhjnm6vw4kpl39zk32svlhlznrrw7722kwk13625fc0pmvlssqn";
      };
    }
  ];
}
