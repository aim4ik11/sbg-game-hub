import type { Metadata } from "next";
import { ReactNode } from "react";
import MainHeader from "../../components/main-header/MainHeader";

export const metadata: Metadata = {
  title: "SBG Game Hub",
  description: "Website for boardgame sessions",
};

interface RootLayoutProps {
  children: ReactNode;
}

export default function RootLayout({ children }: RootLayoutProps) {
  return (
    <html lang="uk">
      <head>
        <title>My website</title>
      </head>
      <body>
        <MainHeader />
        <div>
          {children}
        </div>
      </body>
    </html>
  );
}
