"use client"
import HomePage from "@/Components/HomePageComponents/HomePage";
import Image from "next/image";
import { useRouter } from "next/navigation";
export default function Home() {
  const router=useRouter();
  return (
    <>
   <div>landing page work in progress </div>
   <button  className="flex justify-center items-center h-10 bg-indigo-600 text-white font-bold rounded-md hover:opacity-80" onClick={()=>router.push("/auth/login")}>
              Login
    </button>
   </>
  );
}
