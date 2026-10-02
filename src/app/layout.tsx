import type { Metadata } from "next";
import "./globals.css";
import Providers from "@/components/Providers";

export const metadata: Metadata = {
  title: "Ship Recycling and Hazardous Materials Inventory",
  description: "Maintain vessel-specific hazardous-material inventories, supplier declarations, survey evidence and recycling-plan approvals.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>
        <Providers>{children}</Providers>
      </body>
    </html>
  );
}
