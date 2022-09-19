FROM node
RUN adduser -D priya
USER priya
WORKDIR /usr/src/app
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]
