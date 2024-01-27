import Image from "next/image";

export default function Home() {
  return (
    <div>
      <h1>Next.js</h1>
      <Image
        src="/images/nextjs.png"
        alt="Next.js Logo"
        width={200}
        height={160}
      />
    </div>
  );
}
