FROM alpine:edge

RUN apk --no-cache add git neovim bash nodejs npm ripgrep alpine-sdk

WORKDIR /root/.config/nvim
COPY . .

RUN nvim --headless -c 'autocmd User PackerComplete sleep 20 | quitall' -c 'silent PackerSync'
RUN nvim --headless \
        +"sleep 10" \
        +"silent TSInstall python bash" \
        +"silent LspInstall python" \
        +"silent LspInstalln bash" \
        +"sleep 120" \
        +qa

ENTRYPOINT ["bash"]
