PROJECT_DIR=${PROJECT_DIR:-"$HOME/projects"};
cd $PROJECT_DIR;
echo 'severity = 3' > ~/.perlcriticrc;
[ ! -d  perl-git-hooks ] && git clone https://github.com/mattp-/perl-git-hooks.git;
cd perl-git-hooks/hooks;
[ ! -e pre-commit ] && ln -s pre-commit.critical pre-commit;
git config --global init.templatedir "$PROJECT_DIR/perl-git-hooks";

PROJECTS=(
    whitelabel-api
    whitelabel-admin-pages
    whitelabel-user-pages
    crm-app-helpdesk
    crm-app-libs
    fxweb
    crm-app-id-processing
    tools-libs
    soap-client-proxy-server
);

for PROJECT in ${PROJECTS[*]}; do
    echo "Setting pre-commit for $PROJECT_DIR/$PROJECT";
    cd $PROJECT_DIR/$PROJECT;
    [ -f .git/hooks/pre-commit ] && rm .git/hooks/pre-commit;
    git init;
done;


